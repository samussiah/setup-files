#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
EnvGet, user, USERNAME
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force
AutoTrim off
StringCaseSense On

;Edit autoHotKey: CTRL + ALT + [
^![::
    run, gvim.exe "C:\Users\%username%\vimfiles\autoHotKey.ahk"
Return

;Run autoHotKey: CTRL + ALT + ]
^!]::
    run, C:\Users\%username%\vimfiles\autoHotKey.ahk
Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; miscellaneous
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

::node log::console.log(util.inspect(, false, null, true));

::polyfills::
    Gosub :?:object assign
    SendInput `n`n
    Gosub :?:array find
    SendInput `n`n
    Gosub :?:array includes
    SendInput `n`n
    Gosub :?:array findIndex
return

::shrug::¯\_(?)_/¯

::ghash::git rev-parse HEAD | clip

:?:i tn::
(
# Test notes
* 
)

:?:pr i::
(
# Issues
Closes 
)

::rinc::https://github.com/RhoInc

::logh::127.0.0.1/edsa-GitHub

::logr::127.0.0.1/edsa-graphics

::grfx::http://interactive.it.rhoworld.com/dev/

:*C:grrq::https://jira.it.rhoworld.com/browse/GRRQ

::web ex::https://rhoworld.webex.com/join/spencer_childress

::npmi::npm install d3@3 webcharts && npm install --save-dev @babel/core @babel/preset-env prettier rollup rollup-plugin-babel

;Program history line item with current date
^!u::
   Send,%A_Space%%A_Space%%A_Space%%A_Space%%A_YYYY%-%A_MM%-%A_DD%  Spencer Childress%A_Space%%A_Space%%A_Space%
Return

::svncom::svn commit --non-interactive -m ''

::fandr::find ./ -type f -exec sed -i -e 's///g' {{}{}} \;

::pretty json::cat .json | python -m json.tool >> .json

::pyjson::{%}{!}python -m json.tool

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; javascript
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

:?:object assign::
    SendInput if (typeof Object.assign {!}= 'function') {{}
    SendInput `n    Object.defineProperty(
    SendInput `n        Object,
    SendInput `n        'assign',
    SendInput `n        {{}
    SendInput `n            value: function assign(target, varArgs) {{} // .length of function is 2
    SendInput `n                'use strict';
    SendInput `n
    SendInput `n                if (target == null) {{} // TypeError if undefined or null
    SendInput `n                    throw new TypeError('Cannot convert undefined or null to object');
    SendInput `n                {}}
    SendInput `n
    SendInput `n                var to = Object(target);
    SendInput `n
    SendInput `n                for (var index = 1; index < arguments.length; index{+}{+}) {{}
    SendInput `n                    var nextSource = arguments[index];
    SendInput `n
    SendInput `n                    if (nextSource {!}= null) {{} // Skip over if undefined or null
    SendInput `n                        for (var nextKey in nextSource) {{}
    SendInput `n                            // Avoid bugs when hasOwnProperty is shadowed
    SendInput `n                            if (Object.prototype.hasOwnProperty.call(nextSource, nextKey)) {{}
    SendInput `n                                to[nextKey] = nextSource[nextKey];
    SendInput `n                            {}}
    SendInput `n                        {}}
    SendInput `n                    {}}
    SendInput `n                {}}
    SendInput `n
    SendInput `n                return to;
    SendInput `n            {}},
    SendInput `n            writable: true,
    SendInput `n            configurable: true
    SendInput `n        {}}
    SendInput `n    `);
    SendInput `n{}}
Return

:?:array find::
    SendInput if ({!}Array.prototype.find) {{}
    SendInput `n    Object.defineProperty(
    SendInput `n        Array.prototype,
    SendInput `n        'find',
    SendInput `n        {{}
    SendInput `n            value: function(predicate) {{}
    SendInput `n                // 1. Let O be ? ToObject(this value).
    SendInput `n                if (this == null) {{}
    SendInput `n                    throw new TypeError('"this" is null or not defined');
    SendInput `n                {}}
    SendInput `n
    SendInput `n                var o = Object(this);
    SendInput `n
    SendInput `n                // 2. Let len be ? ToLength(? Get(O, 'length')).
    SendInput `n                var len = o.length >>> 0;
    SendInput `n
    SendInput `n                // 3. If IsCallable(predicate) is false, throw a TypeError exception.
    SendInput `n                if (typeof predicate {!}== 'function') {{}
    SendInput `n                    throw new TypeError('predicate must be a function');
    SendInput `n                {}}
    SendInput `n
    SendInput `n                // 4. If thisArg was supplied, let T be thisArg; else let T be undefined.
    SendInput `n                var thisArg = arguments[1];
    SendInput `n
    SendInput `n                // 5. Let k be 0.
    SendInput `n                var k = 0;
    SendInput `n
    SendInput `n                // 6. Repeat, while k < len
    SendInput `n                while (k < len) {{}
    SendInput `n                    // a. Let Pk be {!} ToString(k).
    SendInput `n                    // b. Let kValue be ? Get(O, Pk).
    SendInput `n                    // c. Let testResult be ToBoolean(? Call(predicate, T, « kValue, k, O »)).
    SendInput `n                    // d. If testResult is true, return kValue.
    SendInput `n                    var kValue = o[k];
    SendInput `n                    if (predicate.call(thisArg, kValue, k, o)) {{}
    SendInput `n                        return kValue;
    SendInput `n                    {}}
    SendInput `n                    // e. Increase k by 1.
    SendInput `n                    k{+}{+};
    SendInput `n                {}}
    SendInput `n
    SendInput `n                // 7. Return undefined.
    SendInput `n                return undefined;
    SendInput `n            {}}
    SendInput `n        {}}
    SendInput `n    `);
    SendInput `n{}}
Return

:?:array includes::
    SendInput if ({!}Array.prototype.includes) {{}
    SendInput `n    Object.defineProperty(
    SendInput `n        Array.prototype,
    SendInput `n        'includes',
    SendInput `n        {{}
    SendInput `n            value: function(valueToFind, fromIndex) {{}
    SendInput `n                if (this == null) {{}
    SendInput `n                    throw new TypeError('"this" is null or not defined');
    SendInput `n                {}}
    SendInput `n
    SendInput `n                // 1. Let O be ? ToObject(this value).
    SendInput `n                var o = Object(this);
    SendInput `n
    SendInput `n                // 2. Let len be ? ToLength(? Get(O, "length")).
    SendInput `n                var len = o.length >>> 0;
    SendInput `n
    SendInput `n                // 3. If len is 0, return false.
    SendInput `n                if (len === 0) {{}
    SendInput `n                    return false;
    SendInput `n                {}}
    SendInput `n
    SendInput `n                // 4. Let n be ? ToInteger(fromIndex).
    SendInput `n                //        (If fromIndex is undefined, this step produces the value 0.)
    SendInput `n                var n = fromIndex | 0;
    SendInput `n
    SendInput `n                // 5. If n = 0, then
    SendInput `n                //    a. Let k be n.
    SendInput `n                // 6. Else n < 0,
    SendInput `n                //    a. Let k be len {+} n.
    SendInput `n                //    b. If k < 0, let k be 0.
    SendInput `n                var k = Math.max(n >= 0 ? n : len - Math.abs(n), 0);
    SendInput `n
    SendInput `n                function sameValueZero(x, y) {{}
    SendInput `n                    return x === y || (typeof x === 'number' && typeof y === 'number' && isNaN(x) && isNaN(y));
    SendInput `n                {}}
    SendInput `n
    SendInput `n                // 7. Repeat, while k < len
    SendInput `n                while (k < len) {{}
    SendInput `n                    // a. Let elementK be the result of ? Get(O, {!} ToString(k)).
    SendInput `n                    // b. If SameValueZero(valueToFind, elementK) is true, return true.
    SendInput `n                    if (sameValueZero(o[k], valueToFind)) {{}
    SendInput `n                        return true;
    SendInput `n                    {}}
    SendInput `n                    // c. Increase k by 1. 
    SendInput `n                    k{+}{+};
    SendInput `n                {}}
    SendInput `n
    SendInput `n                // 8. Return false
    SendInput `n                return false;
    SendInput `n            {}}
    SendInput `n        {}}
    SendInput `n    `);
    SendInput `n{}}
Return

:?:array findIndex::
    SendInput if ({!}Array.prototype.findIndex) {{}
    SendInput `n    Object.defineProperty(
    SendInput `n        Array.prototype,
    SendInput `n        'findIndex',
    SendInput `n        {{}
    SendInput `n            value: function(predicate) {{}
    SendInput `n                // 1. Let O be ? ToObject(this value).
    SendInput `n                if (this == null) {{}
    SendInput `n                    throw new TypeError('"this" is null or not defined');
    SendInput `n                {}}
    SendInput `n
    SendInput `n                var o = Object(this);
    SendInput `n
    SendInput `n                // 2. Let len be ? ToLength(? Get(O, "length")).
    SendInput `n                var len = o.length >>> 0;
    SendInput `n
    SendInput `n                // 3. If IsCallable(predicate) is false, throw a TypeError exception.
    SendInput `n                if (typeof predicate {!}== 'function') {{}
    SendInput `n                    throw new TypeError('predicate must be a function');
    SendInput `n                {}}
    SendInput `n
    SendInput `n                // 4. If thisArg was supplied, let T be thisArg; else let T be undefined.
    SendInput `n                var thisArg = arguments[1];
    SendInput `n
    SendInput `n                // 5. Let k be 0.
    SendInput `n                var k = 0;
    SendInput `n
    SendInput `n                // 6. Repeat, while k < len
    SendInput `n                while (k < len) {{}
    SendInput `n                    // a. Let Pk be {!} ToString(k).
    SendInput `n                    // b. Let kValue be ? Get(O, Pk).
    SendInput `n                    // c. Let testResult be ToBoolean(? Call(predicate, T, « kValue, k, O »)).
    SendInput `n                    // d. If testResult is true, return k.
    SendInput `n                    var kValue = o[k];
    SendInput `n                    if (predicate.call(thisArg, kValue, k, o)) {{}
    SendInput `n                        return k;
    SendInput `n                    {}}
    SendInput `n                    // e. Increase k by 1.
    SendInput `n                    k{+}{+};
    SendInput `n                {}}
    SendInput `n
    SendInput `n                // 7. Return -1.
    SendInput `n                return -1;
    SendInput `n            {}}
    SendInput `n        {}}
    SendInput `n    `);
    SendInput `n{}}
Return

::exdf::
(
export default function () {
}
)

::imdf::import  from '';

::imd3::import {{}  {}} from 'd3';

::clog::console.log

::spkg::start package.json

:?:prfrm::
(
    const t0 = performance.now();
    //begin performance test
    code();
    //end performance test
    const t1 = performance.now();
    console.log(``[code] took ${t1 - t0} milliseconds.``);
)

:?:pkg json::
(
    "name": "",
    "version": "",
    "description": "",
    "module": "./src/index.js",
    "main": "./bundle.js",
    "dependencies": {
        "d3": "^3",
        "webcharts": "^1"
    },
    "scripts": {
        "build": "npm audit fix && npm run bundle && npm run format",
        "bundle": "rollup -c",
        "format": "npm run format-src && npm run format-bundle",
        "format-src": "prettier --print-width=100 --tab-width=4 --single-quote --write \"./src/**/*.js\"",
        "format-bundle": "prettier --print-width=100 --tab-width=4 --single-quote --write ./bundle.js",
        "test-page": "start chrome ./test-page/index.html && start firefox ./test-page/index.html && start iexplore file://%CD%/test-page/index.html",
        "watch": "rollup -c -w"
    },
    "devDependencies": {
        "@babel/core": "^7.4.5",
        "@babel/preset-env": "^7.4.5",
        "prettier": "^1.17.1",
        "rollup": "^1.12.3",
        "rollup-plugin-babel": "^4.3.2"
    }
)

::unittest::"test": "mocha --require @babel/register ./test/*.js",

::testpage::"test-page": "start chrome ./test-page/index.html && start firefox ./test-page/index.html && start iexplore file://%CD%/test-page/index.html",

::d3set::console.log(d3.set(data.map(d => d[''])).values())

:?:rollup config::
(
import babel from 'rollup-plugin-babel';

const pkg = require('./package.json');

export default {
    input: pkg.module,
    output: {
        name: pkg.name
            .split('-')
            .map((str,i) =>
                i === 0 ?
                    str :
                    (str.substring(0,1).toUpperCase() + str.substring(1))
            `)
            .join(''),
        file: pkg.main,
        format: 'umd',
        globals: {
            d3: 'd3',
            webcharts: 'webCharts'
        },
    },
    external: (function() {
        const dependencies = pkg.dependencies;

        return Object.keys(dependencies);
    }()),
    plugins: [
        babel({
            exclude: 'node_modules/**',
            presets: [
                [ '@babel/preset-env' ]
            ],
            babelrc: false
        })
    ]
};
)

:?:web chart::
(
/*------------------------------------------------------------------------------------------------\
  Chart
\------------------------------------------------------------------------------------------------*/

    const element = '#container';
    const settings = {
        x: {
            type: 'linear',
            column: '',
            label: '',
        },
        y: {
            type: 'linear',
            column: '',
            label: '',
        },
        marks: [
            {
                type: 'circle',
                per: ['', ''],
                summarizeY: 'mean',
                radius: 5,
                attributes: {},
            },
            {
                type: 'bar',
                per: [''],
                summarizeY: 'mean',
                split: '',
                arrange: 'grouped',
                attributes: {},
            },
            {
                type: 'line',
                per: [''],
                summarizeY: 'mean',
                attributes: {},
            },
            {
                type: 'text',
                per: ['', ''],
                summarizeY: 'mean',
                text: '$y',
                attributes: {},
            },
        ],
        color_by: '',
        color_dom: [],
        legend: {
            label: '',
            order: []
        }
    };
    const controls = new webCharts.createControls(
        element + ' .header',
        {
            inputs: [
                {
                    type: 'subsetter',
                    value_col: '',
                    label: '',
                    start: null,
                },
                {
                    type: 'dropdown',
                    options: [''],
                    label: '',
                    values: [''],
                }
            ]
        }
    `);
    const chart = new webCharts.createChart(
        element,
        settings,
        controls
    `);

    d3.csv(
        './.csv',
        (d,i) => {
            return d;
        },
        data => {
            chart.init(data);
        }
    `);

    /**-------------------------------------------------------------------------------------------\
      Callbacks
    \-------------------------------------------------------------------------------------------**/

        chart.on('init', function() {
            const context = this;
        });

        chart.on('layout', function() {
            const context = this;
        });

        chart.on('preprocess', function() {
            const context = this;
        });

        chart.on('datatransform', function() {
            const context = this;
        });

        chart.on('draw', function() {
            const context = this;
        });

        chart.on('resize', function() {
            const context = this;
        });
)

:?:clonejs::
(
function clone(obj) {
    let copy;

    //boolean, number, string, null, undefined
    if ('object' != typeof obj || null == obj)
        return obj;

    //date
    if (obj instanceof Date) {
        copy = new Date();
        copy.setTime(obj.getTime());
        return copy;
    }

    //array
    if (obj instanceof Array) {
        copy = [];
        for (var i = 0, len = obj.length; i < len; i++) {
            copy[i] = clone(obj[i]);
        }
        return copy;
    }

    //object
    if (obj instanceof Object) {
        copy = {};
        for (var attr in obj) {
            if (obj.hasOwnProperty(attr))
                copy[attr] = clone(obj[attr]);
        }
        return copy;
    }

    throw new Error('Unable to copy [obj]! Its type is not supported.');
}
)

:?:mergejs::
(
var hasOwnProperty = Object.prototype.hasOwnProperty;
var propIsEnumerable = Object.prototype.propertyIsEnumerable;

function toObject(val) {
    if (val === null || val === undefined) {
        throw new TypeError('Cannot convert undefined or null to object');
    }

    return Object(val);
}

function isObj(x) {
    var type = typeof x;
    return x !== null && (type === 'object' || type === 'function');
}

function assignKey(to, from, key) {
    var val = from[key];

    if (val === undefined || val === null) {
        return;
    }

    if (hasOwnProperty.call(to, key)) {
        if (to[key] === undefined || to[key] === null) {
            throw new TypeError('Cannot convert undefined or null to object (' + key + ')');
        }
    }

    if (!hasOwnProperty.call(to, key) || !isObj(val) || val instanceof Array) {
        to[key] = val;
    } else {
        to[key] = assign(Object(to[key]), from[key]);
    }
}

function assign(to, from) {
    if (to === from) {
        return to;
    }

    from = Object(from);

    for (var key in from) {
        if (hasOwnProperty.call(from, key)) {
            assignKey(to, from, key);
        }
    }

    if (Object.getOwnPropertySymbols) {
        var symbols = Object.getOwnPropertySymbols(from);

        for (var i = 0; i < symbols.length; i++) {
            if (propIsEnumerable.call(from, symbols[i])) {
                assignKey(to, from, symbols[i]);
            }
        }
    }

    return to;
}

function merge(target) {
    target = toObject(target);

    for (var s = 1; s < arguments.length; s++) {
        assign(target, arguments[s]);
    }

    return target;
}
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; git
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

:*C:gprune::git remote prune origin && git branch | egrep -v '(master|\*)' | xargs git branch -D

:*C:gpush::git push --set-upstream origin 

:*C:gcom::git commit -a -m 

:*C:gadd::git add -A

:*C:gbr::git branch -a

:*C:gdiff::git diff --name-only --diff-filter=U

:*C:gdl::git branch -d 

:*C:gdr::git push origin --delete 

:*C:gtag::git checkout master && git pull && git tag v && git push origin v

:*C:gclean::git checkout master && git pull && git remote prune origin && git branch | egrep -v '(master|\*)' | xargs git branch -D

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; html
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

:?:index js::
(
d3.csv(
    'https://raw.githubusercontent.com/RhoInc/data-library/master/data/clinical-trials/.csv',
    function(d,i) {
        return d;
    },
    function(data) {
        const instance = (
            '#container', // element
            {
            } // settings
        `);
        instance.init(data);
    }
`);
)

:?:index html::
(
<!DOCTYPE html>
<html>
    <head>
        <title>Title: Subtitle</title>
        <meta http-equiv = 'Content-Type' content = 'text/html; charset = utf-8'>

        <script type = 'text/javascript' src = 'https://d3js.org/d3.v3.min.js'></script>
        <script type = 'text/javascript' src = 'https://cdn.jsdelivr.net/gh/RhoInc/Webcharts/build/webcharts.min.js'></script>

        <link type = 'text/css' rel = 'stylesheet' href = 'https://cdn.jsdelivr.net/gh/RhoInc/Webcharts/css/webcharts.min.css'>
        <link type = 'text/css' rel = 'stylesheet' href = './index.css'>
    </head>

    <body>
        <div id = 'title'>Title</div>
        <div id = 'subtitle'>Subtitle</div>
        <div id = 'container'></div>
    </body>

    <script type = 'text/javascript' src = './index.js'></script>
</html>
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; css
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

:?:index css::
(
@import url(https://fonts.googleapis.com/css?family=Open+Sans:400,300);
* {
    padding: 0;
    margin: 0;
    font-family: 'Open Sans';
}
#title {
    width: 96%;
    padding: 0 0 12px 0;
    border-bottom: 2px solid lightgray;
    margin: 24px 2% 12px 2%;
    font-size: 32px;
    font-weight: normal;
}
#subtitle {
    width: 96%;
    margin: 0 2% 12px 2%;
    font-size: 24px;
    font-weight: lighter;
}
#container {
    width: 96%;
    margin: 12px 2%;
    display: inline-block;
}
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; r
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

::r batch::start /b /wait I:\WINAPPS\R\bin\R.exe CMD BATCH --no-save --vanilla --slave --quiet file.R

:?:lib path::
(
if (file.exists('r-packages'))
    .libPaths('r-packages')
assign('.lib.loc', 'r-packages', envir = environment(.libPaths))
)

:?:rheader::
(
#-------------------------------------------------------------------------------------------------#
#
# Project:        
#
#     Program:  
#
#     Purpose:  
#
#     Input:    
#
#     Output:   
#
#     Packages: 
#
#     Version:  
#
#-------------------------------------------------------------------------------------------------#
# Program history:
#-------------------------------------------------------------------------------------------------#
#
#   Date        Programmer          Description
#   ----------  ------------------  --------------------------------------------------------------
#
#
#-------------------------------------------------------------------------------------------------#
)

:?:read csv::
(
# input data
data <- 'file.csv' %>%
    data.table`:`:fread(
        sep = ',',
        na.strings = '',
        colClasses = 'character'
    `)
)

:?:write csv::
(
# output data
data %>%
    data.table`:`:fwrite(
        'file.csv',
        na = '',
        row.names = FALSE
    `)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; sas
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

:?:sas batch::
(
@echo off

    call "I:\RHO_APPS\SAS Grid\GridBatch\PROD\gridBatch94.bat" ".sas"

exit
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; comments
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

:?:comjs::
(
/*------------------------------------------------------------------------------------------------\
  
\------------------------------------------------------------------------------------------------*/
)

:?:comjs1::
(
    /**-------------------------------------------------------------------------------------------\
      
    \-------------------------------------------------------------------------------------------**/
)

:?:comjs2::
(
        /***--------------------------------------------------------------------------------------\
          
        \--------------------------------------------------------------------------------------***/
)

:?:comjs3::
(
            /****---------------------------------------------------------------------------------\
              
            \---------------------------------------------------------------------------------****/
)

:?:comjs4::
(
                /*****----------------------------------------------------------------------------\
                  
                \----------------------------------------------------------------------------*****/
)

:?:comr::
(
#-------------------------------------------------------------------------------------------------#
# 
#-------------------------------------------------------------------------------------------------#
)

:?:comr1::
(
    ##-------------------------------------------------------------------------------------------##
    # 
    ##-------------------------------------------------------------------------------------------##
)

:?:comr2::
(
        ###-------------------------------------------------------------------------------------###
        # 
        ###-------------------------------------------------------------------------------------###
)

:?:comr3::
(
            ####-------------------------------------------------------------------------------####
            # 
            ####-------------------------------------------------------------------------------####
)

:?:comr4::
(
                #####-------------------------------------------------------------------------#####
                # 
                #####-------------------------------------------------------------------------#####
)

:?:maccom::
(
%put;
%put %nrstr(/-------------------------------------------------------------------------------------------------\);
%put %nrstr(  );
%put %nrstr(\-------------------------------------------------------------------------------------------------/);
%put;
)

:?:maccom1::
(
    %put;
    %put %nrstr(    /---------------------------------------------------------------------------------------------\);
    %put %nrstr(      );
    %put %nrstr(    \---------------------------------------------------------------------------------------------/);
    %put;
)

:?:maccom2::
(
        %put;
        %put %nrstr(        /-----------------------------------------------------------------------------------------\);
        %put %nrstr(          );
        %put %nrstr(        \-----------------------------------------------------------------------------------------/);
        %put;
)

:?:maccom3::
(
            %put;
            %put %nrstr(            /-------------------------------------------------------------------------------------\);
            %put %nrstr(              );
            %put %nrstr(            \-------------------------------------------------------------------------------------/);
            %put;
)

:?:maccom4::
(
                %put;
                %put %nrstr(                /---------------------------------------------------------------------------------\);
                %put %nrstr(                  );
                %put %nrstr(                \---------------------------------------------------------------------------------/);
                %put;
)

:?:miccom::%put %str(    --> );
