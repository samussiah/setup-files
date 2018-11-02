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
    run, gvim.exe C:\Users\%user%\vimfiles\autoHotKey.ahk
Return

;Run autoHotKey: CTRL + ALT + ]
^!]::
    run, C:\Users\%user%\vimfiles\autoHotKey.ahk
Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; miscellaneous
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;Program history line item with current date
^!u::
   Send,%A_Space%%A_Space%%A_Space%%A_Space%%A_YYYY%-%A_MM%-%A_DD%  Spencer Childress%A_Space%%A_Space%%A_Space%
Return

::svncom::svn commit --non-interactive -m ''

::fandr::find ./ -type f -exec sed -i -e 's///g' {{}{}} \;

::pretty json::cat .json | python -m json.tool >> .json

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; javascript
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

:?:array find::
(
if (!Array.prototype.find) {
    Object.defineProperty(
        Array.prototype,
        'find',
        {
            value: function(predicate) {
                // 1. Let O be ? ToObject(this value).
                if (this == null) {
                    throw new TypeError('"this" is null or not defined');
                }

                var o = Object(this);

                // 2. Let len be ? ToLength(? Get(O, 'length')).
                var len = o.length >>> 0;

                // 3. If IsCallable(predicate) is false, throw a TypeError exception.
                if (typeof predicate !== 'function') {
                    throw new TypeError('predicate must be a function');
                }

                // 4. If thisArg was supplied, let T be thisArg; else let T be undefined.
                var thisArg = arguments[1];

                // 5. Let k be 0.
                var k = 0;

                // 6. Repeat, while k < len
                while (k < len) {
                    // a. Let Pk be ! ToString(k).
                    // b. Let kValue be ? Get(O, Pk).
                    // c. Let testResult be ToBoolean(? Call(predicate, T, « kValue, k, O »)).
                    // d. If testResult is true, return kValue.
                    var kValue = o[k];
                    if (predicate.call(thisArg, kValue, k, o)) {
                        return kValue;
                    }
                    // e. Increase k by 1.
                    k++;
                }

                // 7. Return undefined.
                return undefined;
            }
        }
    `);
}
)

:?:array findIndex::
(
if (!Array.prototype.findIndex) {
    Object.defineProperty(
        Array.prototype,
        'findIndex',
        {
            value: function(predicate) {
                // 1. Let O be ? ToObject(this value).
                if (this == null) {
                    throw new TypeError('"this" is null or not defined');
                }

                var o = Object(this);

                // 2. Let len be ? ToLength(? Get(O, "length")).
                var len = o.length >>> 0;

                // 3. If IsCallable(predicate) is false, throw a TypeError exception.
                if (typeof predicate !== 'function') {
                    throw new TypeError('predicate must be a function');
                }

                // 4. If thisArg was supplied, let T be thisArg; else let T be undefined.
                var thisArg = arguments[1];

                // 5. Let k be 0.
                var k = 0;

                // 6. Repeat, while k < len
                while (k < len) {
                    // a. Let Pk be ! ToString(k).
                    // b. Let kValue be ? Get(O, Pk).
                    // c. Let testResult be ToBoolean(? Call(predicate, T, « kValue, k, O »)).
                    // d. If testResult is true, return k.
                    var kValue = o[k];
                    if (predicate.call(thisArg, kValue, k, o)) {
                        return k;
                    }
                    // e. Increase k by 1.
                    k++;
                }

                // 7. Return -1.
                return -1;
            }
        }
    `);
}
)

:?*C:object assign::
(
if (typeof Object.assign != 'function') {
    Object.defineProperty(
        Object,
        'assign',
        {
            value: function assign(target, varArgs) { // .length of function is 2
                'use strict';

                if (target == null) { // TypeError if undefined or null
                    throw new TypeError('Cannot convert undefined or null to object');
                }

                var to = Object(target);

                for (var index = 1; index < arguments.length; index++) {
                    var nextSource = arguments[index];

                    if (nextSource != null) { // Skip over if undefined or null
                        for (var nextKey in nextSource) {
                            // Avoid bugs when hasOwnProperty is shadowed
                            if (Object.prototype.hasOwnProperty.call(nextSource, nextKey)) {
                                to[nextKey] = nextSource[nextKey];
                            }
                        }
                    }
                }

                return to;
            },
            writable: true,
            configurable: true
        }
    `);
}
)

::exdf::
(
export default function
)

::imdf::import  from '';

::imd3::import {{}  {}} from 'd3';

::cl::console.log

::spkg::start package.json

:?:pkg json::
(
  "name": "",
  "version": "",
  "description": "",
  "module": "./src/index.js",
  "main": "./build/.js",
  "dependencies": {
    "d3": "^3",
    "webcharts": "^1"
  },
  "scripts": {
    "build": "npm audit fix && npm run bundle && npm run format",
    "bundle": "rollup -c",
    "format": "npm run format-src && npm run format-bundle",
    "format-src": "prettier --print-width=100 --tab-width=4 --single-quote --write \"./src/**/*.js\"",
    "format-bundle": "prettier --print-width=100 --tab-width=4 --single-quote --write ./build/*.js",
    "test-page": "start chrome ./test-page/index.html && start firefox ./test-page/index.html && start iexplore file://%CD%/test-page/index.html",
    "watch": "rollup -c -w"
  },
  "devDependencies": {
    "babel-plugin-external-helpers": "^6.22.0",
    "babel-preset-env": "^1.6.0",
    "prettier": "^1.7.4",
    "rollup": "^0.66.6",
    "rollup-plugin-babel": "^3.0.2"
  }
)

::testpage::"test-page": "start chrome ./test-page/index.html && start firefox ./test-page/index.html && start iexplore file://%CD%/test-page/index.html",

::d3set::console.log(d3.set(data.map(d => d[''])).values())

:?:rollup config::
(
import babel from 'rollup-plugin-babel';

var pkg = require('./package.json');

module.exports = {
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
        var dependencies = pkg.dependencies;

        return Object.keys(dependencies);
    }()),
    plugins: [
        babel({
            exclude: 'node_modules/**',
            presets: [
                [ 'env', {modules: false} ]
            ],
            plugins: [
                'external-helpers'
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
            location: 'top',
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
        d => {
            return d;
        },
        data => {
            data.forEach(d => {
                    
                });
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

:*C:gtag::git checkout master && git pull && git add v && git push origin v

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; html
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

:?:index js::
(
d3.csv(
    //'https://raw.githubusercontent.com/RhoInc/viz-library/master/data/dataCleaning/visits/dmv_Visits.csv',
    '../../viz-library/data/dataCleaning/visits/dmv_Visits.csv',
    function(d) {
        return d;
    },
    function(data) {
        const pvl = participantVisitListing('#container');
        pvl.init(data);
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
        <script type = 'text/javascript' src = 'https://cdn.jsdelivr.net/gh/RhoInc/Webcharts/build/webcharts.js'></script>

        <link type = 'text/css' rel = 'stylesheet' href = 'https://cdn.jsdelivr.net/gh/RhoInc/Webcharts/css/webcharts.css'>
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
### Input data
    file <- 'file.csv' %>%
        read.csv(
            na.strings = ' ',
            colClasses = 'character'
        `)
)

:?:write csv::
(
### Output data
    file %>%
        write.csv(
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
