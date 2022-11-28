/*******************************************************************************
**
** Copyright (C) 2022 ru.auroraos
**
** This file is part of the My Aurora OS Application project.
**
** Redistribution and use in source and binary forms,
** with or without modification, are permitted provided
** that the following conditions are met:
**
** * Redistributions of source code must retain the above copyright notice,
**   this list of conditions and the following disclaimer.
** * Redistributions in binary form must reproduce the above copyright notice,
**   this list of conditions and the following disclaimer
**   in the documentation and/or other materials provided with the distribution.
** * Neither the name of the copyright holder nor the names of its contributors
**   may be used to endorse or promote products derived from this software
**   without specific prior written permission.
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
** AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
** THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
** FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
** IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
** FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY,
** OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
** PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
** LOSS OF USE, DATA, OR PROFITS;
** OR BUSINESS INTERRUPTION)
** HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
** WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE)
** ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
** EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
**
*******************************************************************************/

import QtQuick 2.0
import Sailfish.Silica 1.0

Page{
    property int first_int: 0;
    property int sec_int: 0;
    property int res_int: 0;
    property int flag: 0;
    property double first_double: 0.0;
    property double sec_double: 0.0;
    property double main_part_double: 0.0;
    property double res_double: 0.0;
    property string first_string: "";
    property string sec_string: "";
    property string res_string: first_string + sec_string;
    property var first_operand;
    property var sec_operand;
    property bool isOperationClicked: false;
    function calculateWorker (str_tmp){
        switch (message)
        {
        case"AC":{
            textarea.text = "";
            break;
            }
        case"M":{
            first_double = Number(res_string);
            main_part_double = Math.floor(first_double);
            sec_double = first_double - main_part_double;
            res_string = String(sec_double);
            break;
            }
        case"p_m":{
            if (flag % 2 == 1)
                {
                    first_string = but_p_m.text + first_string;
                }
            else
                {
                    first_string = first_string;
                }
            break;
            }
        case"1":{
            if (IsOperationClicked == false)
                first_string = first_string + but1.text;
            else
                sec_string = sec_string + but1.text;
            break;
            }
        case"2":{
            if (IsOperationClicked == false)
                first_string = first_string + but2.text;
            else
                sec_string = sec_string + but2.text;
            break;
            }
        case"3":{
            if (IsOperationClicked == false)
                first_string = first_string + but3.text;
            else
                sec_string = sec_string + but3.text;
            break;
            }
        }



    }
    function calcHeightElem (parentHeight, gridSpacing, rowNum){
        return (parentHeight - (gridSpacing * (rowNum-1)))/rowNum;
    }
    function calcWidthElem (parentWidth, gridSpacing, colNum){
       return (parentWidth - (gridSpacing * (colNum-1)))/colNum;
    }
    allowedOrientations: Orientation.all;
    backgroundColor: "black";
    Column{
        id: maincol;
        width: parent.width;
        height: parent.height;
        TextArea{
            id: textarea;
            readOnly: true;
            text: res_string;
            color: "white";
            width: parent.width;
            height: parent.height/2;
        }
        Grid{
            id: buttongrid;
            width: parent.width;
            columns: 4;
            rows: 5;
            spacing: 20;
            property int elemWidth: calcWidthElem(parent.width, buttongrid.spacing, buttongrid.columns) ;
            property int elemHeight: calcHeightElem(parent.height/2, buttongrid.spacing, buttongrid.rows);
            Button{
                id: butAC;
                width: parent.elemWidth
                height: parent.elemHeight;
                text: "AC";
                color: "orange";
                onClicked: {
                    res_string = "";
                    calculateWorker(butAC.text);
                }
            }
            Button{
                id: but_p_m;
                width: parent.elemWidth;
                height: parent.elemHeight;
                text: "+/-";
                color: "orange";
                onClicked: {
                    flag++;
                    calculateWorker("p_m")
                }
            }
            Button{
                id: butM;
                width: parent.elemWidth;
                height: parent.elemHeight;
                text: "M";
                color: "orange";
                //onClicked: {
                    //calculateWorker(butM.text);
                //}

            }
            Button{
                id: but_div;
                width: parent.elemWidth;
                height: parent.elemHeight;
                text: "/";
                color: "orange";
                onClicked: {
                    //
                }
            }
            Button{
                id: but1;
                width: parent.elemWidth;
                height: parent.elemHeight;
                text: "1";
                color: "dark grey";
                onClicked: {
                    //
                }
            }
            Button{
                id: but2;
                width: parent.elemWidth;
                height: parent.elemHeight;
                text: "2";
                color: "dark grey";
                onClicked: {
                    calculateWorker(but2.text);
                }
            }
            Button{
                id: but3;
                width: parent.elemWidth;
                height: parent.elemHeight;
                text: "3";
                color: "dark grey";
                onClicked: {
                    calculateWorker(but3.text);
                    res_string;
                }
            }
            Button{
                id: but_mul;
                width: parent.elemWidth;
                height: parent.elemHeight;
                text: "*";
                color: "orange";
                onClicked: {
                    first_operand = Math.floor(res_string);
                    res_string = res_string + but_mul.text;
                }
            }
            Button{
                id: but4;
                width: parent.elemWidth;
                height: parent.elemHeight;
                text: "4";
                color: "dark grey";
                onClicked: {
                    //
                }
            }
            Button{
                id: but5;
                width: parent.elemWidth;
                height: parent.elemHeight;
                text: "5";
                color: "dark grey";
                onClicked: {
                    //
                }
            }
            Button{
                id: but6;
                width: parent.elemWidth;
                height: parent.elemHeight;
                text: "6";
                color: "dark grey";
                onClicked: {
                    //
                }
            }
            Button{
                id: but_minus;
                width: parent.elemWidth;
                height: parent.elemHeight;
                text: "-";
                color: "orange";
                onClicked: {
                    //
                }
            }
            Button{
                id: but7;
                width: parent.elemWidth;
                height: parent.elemHeight;
                text: "7";
                color: "dark grey";
                onClicked: {
                    //
                }
            }
            Button{
                id: but8;
                width: parent.elemWidth;
                height: parent.elemHeight;
                text: "8";
                color: "dark grey";
                onClicked: {
                    //
                }
            }
            Button{
                id: but9;
                width: parent.elemWidth;
                height: parent.elemHeight;
                text: "9";
                color: "dark grey";
                onClicked: {
                    //
                }
            }
            Button{
                id: but_plus;
                width: parent.elemWidth;
                height: parent.elemHeight;
                text: "+";
                color: "orange";
                onClicked: {
                    //
                }
            }
            Button{
                id: butC;
                width: parent.elemWidth;
                height: parent.elemHeight;
                text: "C";
                color: "grey";
            }
            Button{
                id: but0;
                width: parent.elemWidth;
                height: parent.elemHeight;
                text: "0";
                color: "dark grey";
                onClicked: {
                    //
                }
            }
            Button{
                id: but_dot;
                width: parent.elemWidth;
                height: parent.elemHeight;
                text: ".";
                color: "grey";
                onClicked: {
                    //
                }
            }
            Button{
                id: but_eq;
                width: parent.elemWidth;
                height: parent.elemHeight;
                text: "=";
                color: "orange";
                onClicked: {
                    //
                }
            }
        }
    }
}
