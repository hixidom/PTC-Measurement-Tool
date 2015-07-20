function varargout = introgui(varargin)
% INTROGUI MATLAB code for introgui.fig
%      INTROGUI, by itself, creates a new INTROGUI or raises the existing
%      singleton*.
%
%      H = INTROGUI returns the handle to a new INTROGUI or the handle to
%      the existing singleton*.
%
%      INTROGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTROGUI.M with the given input arguments.
%
%      INTROGUI('Property','Value',...) creates a new INTROGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before introgui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to introgui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help introgui

% Last Modified by GUIDE v2.5 18-Jul-2012 20:30:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @introgui_OpeningFcn, ...
                   'gui_OutputFcn',  @introgui_OutputFcn, ...
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


% --- Executes just before introgui is made visible.
function introgui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to introgui (see VARARGIN)

% Choose default command line output for introgui
handles.output = hObject;
vars=evalin('base','vars');
set(handles.trialcounter,'String',strcat({'Trial  '},num2str(vars.curtrial),{' / '},num2str(vars.trialnum)));
set(handles.subtrialcounter,'String',strcat({'Subtrial  '},num2str(vars.cursubtrial),{' / '},num2str(vars.subtrialnum)));

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes introgui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = introgui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in startsound.
function startsound_Callback(hObject, eventdata, handles)
% hObject    handle to startsound (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Determine which block contains tone, tonedblock, and the random offset of
%the tone, toneoffset, which is between Ns/2 and (Ns/2)+(Ns/10)
set(handles.output,'Visible','Off');
playtonegui;
