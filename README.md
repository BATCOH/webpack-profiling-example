# Example for [issue #11780](https://github.com/webpack/webpack/issues/11780) at webpack

## UPD You need Node.js 14.6.0+ to reproduce the issue

```bash
git clone https://github.com/BATCOH/webpack-profiling-example.git
cd webpack-profiling-example
npm install
npm run build
```
Drag and drop generated events.json into the Chrome DevTools Profiler.

You can also take events.json from `events/${node_version}` folder of this repo.

## build.sh
Weird shell script that uses [Nodebrew](https://github.com/hokaccha/nodebrew) to produce two events.json (for node 14.5.0 and node 14.6.0), and [jq](https://stedolan.github.io/jq/) with [jd](https://github.com/josephburnett/jd) to somehow compare them.

![DevTools Screenshot](https://raw.githubusercontent.com/BATCOH/webpack-profiling-example/master/devtools.png)
