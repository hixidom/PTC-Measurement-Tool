function varargout = choosegui(varargin)
% CHOOSEGUI MATLAB code for choosegui.fig
%      CHOOSEGUI, by itself, creates a new CHOOSEGUI or raises the existing
%      singleton*.
%
%      H = CHOOSEGUI returns the handle to a new CHOOSEGUI or the handle to
%      the existing singleton*.
%
%      CHOOSEGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHOOSEGUI.M with the given input arguments.
%
%      CHOOSEGUI('Property','Value',...) creates a new CHOOSEGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before choosegui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to choosegui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help choosegui

% Last Modified by GUIDE v2.5 27-Dec-2012 10:41:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @choosegui_OpeningFcn, ...
                   'gui_OutputFcn',  @choosegui_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

% --- Executes just before choosegui is made visible.
function choosegui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to choosegui (see VARARGIN)

% Choose default command line output for choosegui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes choosegui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = choosegui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in block1but.
function block1but_Callback(hObject, eventdata, handles)
% hObject    handle to block1but (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
vars=evalin('base','vars');
if(vars.tonedblock==2)
    switch vars.testtype
        case 1
            if vars.lastanswer==1
                vars.lastanswer=0;
                vars.cursubtrial=vars.cursubtrial+1;
                vars.trialthresh(vars.curtrial)=vars.trialthresh(vars.curtrial)+vars.subtrialamp^2;
            end
            vars.subtrialamp=vars.subtrialamp*sqrt(10^vars.dbstep);
            vars.temptone=vars.temptone*sqrt(10^vars.dbstep);
        case 2
            vars.testdata=vars.testdata+1;
    end
else
    switch vars.testtype
        case 1
            if vars.lastanswer==0
                vars.lastanswer=1;
                vars.cursubtrial=vars.cursubtrial+1;
            end
            vars.subtrialamp=vars.subtrialamp/sqrt(10^vars.dbstep);
            vars.temptone=vars.temptone/sqrt(10^vars.dbstep);
        case 2
            vars.subtrialamp=vars.subtrialamp/sqrt(10^vars.dbstep);
            vars.temptone=vars.temptone/sqrt(10^vars.dbstep);
    end
end
assignin('base','vars',vars);
set(handles.output,'Visible','Off');
gotonext;


% --- Executes on button press in block2but.
function block2but_Callback(hObject, eventdata, handles)
% hObject    handle to block2but (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
vars=evalin('base','vars');
if(vars.tonedblock==1)
    switch vars.testtype
        case 1
            if vars.lastanswer==1
                vars.lastanswer=0;
                vars.cursubtrial=vars.cursubtrial+1;
                vars.trialthresh(vars.curtrial)=vars.trialthresh(vars.curtrial)+vars.subtrialamp^2;
            end
            vars.subtrialamp=vars.subtrialamp*sqrt(10^vars.dbstep);
            vars.temptone=vars.temptone*sqrt(10^vars.dbstep);
        case 2
            vars.testdata=vars.testdata+1;
    end
else
    switch vars.testtype
        case 1
            if vars.lastanswer==0
                vars.lastanswer=1;
                vars.cursubtrial=vars.cursubtrial+1;
            end
            vars.subtrialamp=vars.subtrialamp/sqrt(10^vars.dbstep);
            vars.temptone=vars.temptone/sqrt(10^vars.dbstep);
        case 2
            vars.subtrialamp=vars.subtrialamp/sqrt(10^vars.dbstep);
            vars.temptone=vars.temptone/sqrt(10^vars.dbstep);
    end
end
assignin('base','vars',vars);
set(handles.output,'Visible','Off');
gotonext;


% --- Executes on button press in mistrialbut.
function mistrialbut_Callback(hObject, eventdata, handles)
% hObject    handle to mistrialbut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
resetblocks;
playtonegui;

% --- Executes on button press in notonebut.
function notonebut_Callback(hObject, eventdata, handles)
% hObject    handle to notonebut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
vars=evalin('base','vars');

switch vars.testtype
    case 1
        if vars.lastanswer==1
            vars.lastanswer=0;
            vars.cursubtrial=vars.cursubtrial+1;
            vars.trialthresh(vars.curtrial)=vars.trialthresh(vars.curtrial)+vars.subtrialamp^2;
        end
        vars.subtrialamp=vars.subtrialamp*sqrt(10^vars.dbstep);
            vars.temptone=vars.temptone*sqrt(10^vars.dbstep);
    case 2
        vars.testdata=vars.testdata+1;
end
assignin('base','vars',vars);
set(handles.output,'Visible','Off');
gotonext;


% --- Executes on button press in incdelaybut.
function incdelaybut_Callback(hObject, eventdata, handles)
% hObject    handle to incdelaybut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
vars=evalin('base','vars');
vars.readydelay=vars.readydelay+.4;
assignin('base','vars',vars);
resetblocks;
playtonegui;

% --- Executes on button press in decdelaybut.
function decdelaybut_Callback(hObject, eventdata, handles)
% hObject    handle to decdelaybut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
vars=evalin('base','vars');
vars.readydelay=vars.readydelay-.4;
assignin('base','vars',vars);
resetblocks;
playtonegui;
