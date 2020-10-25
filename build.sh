function build_with_node {
    nodebrew use $1
    node -v
    npm run build

    mkdir -p ./events/$1/
    mv events.json ./events/$1/events.json

    # Get events.json without timestamps and .[].args.data.cpuProfile.nodes
    jq 'del(.[].ts) | del(.[].pid) | del(.[].tid) | del(.[].dur) | del(.[].id) | del(.[].args.data.cpuProfile.startTime) | del(.[].args.data.cpuProfile.endTime) | del(.[].args.data.cpuProfile.samples) |del(.[].args.data.cpuProfile.timeDeltas) | del(.[].args.data.cpuProfile.nodes)' ./events/$1/events.json > ./events/$1/events.clean.json

    # Get only .[].args.data.cpuProfile.nodes without ids
    jq '.[].args.data.cpuProfile.nodes | select(. != null) | del(.[].id) | del(.[].children) | del(.[]?.callFrame.scriptId)' ./events/$1/events.json > ./events/$1/events.nodes.json
}
build_with_node 14.5.0
build_with_node 14.6.0

jd -o=./events/events.clean.diff -set ./events/14.5.0/events.clean.json ./events/14.6.0/events.clean.json
jd -o=./events/events.nodes.diff -set ./events/14.5.0/events.nodes.json ./events/14.6.0/events.nodes.json
