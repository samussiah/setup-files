#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
EnvGet, user, USERNAME
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force
AutoTrim off

;Edit autoHotKey
^![::
    run, gvim.exe C:\Users\%user%\vimfiles\autoHotKey.ahk
Return

;Run autoHotKey
^!]::
    run, C:\Users\%user%\vimfiles\autoHotKey.ahk
Return

;Program history line item with current date
^!u::
   Send,%A_Space%%A_Space%%A_Space%%A_Space%%A_YYYY%-%A_MM%-%A_DD%  Spencer Childress%A_Space%%A_Space%%A_Space%
Return

::graphics::http://interactive.it.rhoworld.com/dev/projects/

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

:?:rcomm::
(
#-------------------------------------------------------------------------------------------------#
# 
#-------------------------------------------------------------------------------------------------#
)

:?:rcomm1::
(
    ##-------------------------------------------------------------------------------------------##
    # 
    ##-------------------------------------------------------------------------------------------##
)

:?:comm::
(
/*------------------------------------------------------------------------------------------------\
  
\------------------------------------------------------------------------------------------------*/
)

:?:comm1::
(
    /**-------------------------------------------------------------------------------------------\
      
    \-------------------------------------------------------------------------------------------**/
)

:?:comm2::
(
        /***--------------------------------------------------------------------------------------\
          
        \--------------------------------------------------------------------------------------***/
)

:?:comm3::
(
            /****---------------------------------------------------------------------------------\
              
            \---------------------------------------------------------------------------------****/
)

:?:comm4::
(
                /*****----------------------------------------------------------------------------\
                  
                \----------------------------------------------------------------------------*****/
)

:?:comm5::
(
                    /******-----------------------------------------------------------------------\
                      
                    \-----------------------------------------------------------------------******/
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

:?:miccom::%put %str(    --> );

:?:index html::
(
<!DOCTYPE html>
<html>
    <head>
        <title></title>
        <div id = 'title'></div>
        <div id = 'subtitle'></div>
        <meta http-equiv = 'Content-Type' content = 'text/html; charset = utf-8'>

        <script type = 'text/javascript' src = 'https://rawgit.com/jashkenas/underscore/master/underscore.js'></script>
        <script type = 'text/javascript' src = 'https://d3js.org/d3.v3.min.js'></script>
        <script type = 'text/javascript' src = 'https://rawgit.com/RhoInc/Webcharts/master/build/webcharts.js'></script>

        <link type = 'text/css' rel = 'stylesheet' href = 'https://rawgit.com/RhoInc/Webcharts/master/css/webcharts.css'>
        <link type = 'text/css' rel = 'stylesheet' href = './index.css'>
    </head>

    <body>
        <div id = 'container'></div>
    </body>

    <script type = 'text/javascript' src = './index.js'></script>
</html>
)

:?:index css::
(
@import url(https://fonts.googleapis.com/css?family=Open+Sans:400,300);
* {
    padding: 0;
    margin: 0;
    font-family: 'Open Sans';
}
#title {
    width: 100%;
    padding: 0 0 12px 0;
    border-bottom: 2px solid lightgray;
    margin: 24px 24px 12px 24px;
    font-size: 32px;
    font-weight: normal;
}
#subtitle {
    width: 100%;
    margin: 0 24px 12px 24px;
    font-size: 24px;
    font-weight: lighter;
}
#container {
    width: 100%;
    margin: 12px 24px;
    display: inline-block;
}
)

:?:more css::
(
#title-note {
    float: right;
    font-size: 35%;
    position: absolute;
    bottom: 5px;
    right: 0px;
}
#container .chart .header {
    font-weight: normal;
    font-size: 150%;
    border-bottom: 1px solid lightgray;
    height: 35px;
    position: relative;
    margin-bottom: 1%;
}
#container .chart .header .wc-controls {
    font-weight: lighter;
    font-size: 60%;
    float: right;
    margin: 0;
    position: absolute;
    bottom: 5px;
    right: 0;
}
#container .chart .header .wc-controls .control-group {
    margin: 0;
}
#container .chart .header .wc-controls .control-group:not(:last-child) {
    margin-right: 10px;
}
#container .chart .header .wc-controls .control-group > * {
    display: inline-block;
}
#container .chart .header .wc-controls .control-group .control-label {
}
#container .chart .header .wc-controls .control-group .span-description {
    display: none;
}
#container .chart .header .wc-controls .control-group .changer {
    margin-left: 5px;
}
)

:?:web chart::
(
/*------------------------------------------------------------------------------------------------\
  Chart
\------------------------------------------------------------------------------------------------*/

    const
        element = '#container',
        settings =
            {x: {type: 'linear'
                ,column: ''
                ,label: ''}
            ,y: {type: 'linear'
                ,column: ''
                ,label: ''}
            ,marks:
                [
                    {type: 'line'
                    ,per: ['']
                    ,summarizeY: 'mean'}
                ,
                    {type: 'circle'
                    ,per: ['', '']
                    ,summarizeY: 'mean'}
                ]
            ,color_by: ''
            ,color_dom: []
            ,legend:
                {order: []}},
        controls = new webCharts.createControls
            (element + ' .header'
            ,   {location: 'top'
                ,inputs:
                    [
                        {type: 'subsetter'
                        ,value_col: ''
                        ,label: ''
                        ,start: null}
                    ,
                        {type: 'dropdown'
                        ,options: ['']
                        ,label: ''
                        ,values: ['']}
                    ]}),
        chart = new webCharts.createChart
            (element
            ,settings
            ,controls);

    d3.csv('./.csv', data => {
        data.forEach(d => {
                
            });
        chart.init(data);
    });

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

::babelrc::echo '{{} 'presets': ['es2015'] {}}' > .babelrc

::transpile::../../../../node_modules/babel-cli/bin/babel.js index.js --watch --out-file indexTranspiled.js

:?:read csv::
(
### Input data
    file <- read.csv(
        'file.csv',
        na.strings = ' ',
        colClasses = 'character')
)

:?:write csv::
(
### Output data
    write.csv(
        file,
        'file.csv',
        na = '',
        row.names = FALSE)
)

::pushup::git push --set-upstream origin 

::web ex::https://rhoworld.webex.com/join/spencer_childress

::rinc::https://github.com/RhoInc

::d3set::console.log(d3.set(data.map(d => d[''])).values())

:?:gbatch::
(
@echo off

    call "I:\RHO_APPS\SAS Grid\GridBatch\PROD\gridBatch94.bat" ".sas"

exit
)

:?:rollup config::
(
import babel from "rollup-plugin-babel";

module.exports = {
    "name": "",
    "input": "./src/index.js",
    "output": {
        "file": "./build/.js",
        "format": "umd"
    },
    "globals": {
        "d3": "d3",
        "webcharts": "webCharts"
    },
    "external": (function() {
        var dependencies = require("./package.json").dependencies;

        return Object.keys(dependencies);
    }()),
    "plugins": [
        babel({
            "exclude": "node_modules/**",
            "presets": [
                [ "env", {"modules": false} ]
            ],
            "plugins": [
                "external-helpers"
            ],
            "babelrc": false
        })
    ]
};
)

::prune::git remote prune origin && git branch | egrep -v '(master|\*)' | xargs git branch -D

::lgh::127.0.0.1/edsa-GitHub

::lgr::127.0.0.1/edsa-graphics

::r batch::start /b /wait I:\WINAPPS\R\bin\R.exe CMD BATCH --no-save --vanilla --slave --quiet file.R

::lib path::assign('.lib.loc', 'r-packages', envir = environment(.libPaths))

::cons::console.log(

:?:edf::
(
export default function () {
    
}
)

:?:idf::import  from '';

::spkg::start package.json

:?:pkg json::
(
  "scripts": {
    "build": "npm run bundle && npm run format",
    "bundle": "rollup -c",
    "format": "npm run format-src && npm run format-bundle",
    "format-src": "prettier --print-width=100 --tab-width=4 --single-quote --write \"./src/**/*.js\"",
    "format-bundle": "prettier --print-width=100 --tab-width=4 --single-quote --write ./build/.js",
    "watch": "rollup -c -w"
  },
  "devDependencies": {
    "babel-plugin-external-helpers": "^6.22.0",
    "babel-preset-env": "^1.6.0",
    "babel-register": "^6.26.0",
    "prettier": "^1.7.4",
    "rollup": "^0.50.0",
    "rollup-plugin-babel": "^3.0.2",
    "rollup-watch": "^4.3.1"
  }
)

::svncommit::svn commit --non-interactive -m ''

::fandr::find ./ -type f -exec sed -i -e 's///g' {{}{}} \;
