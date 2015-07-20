function varargout = readygui(varargin)
% READYGUI MATLAB code for readygui.fig
%      READYGUI, by itself, creates a new READYGUI or raises the existing
%      singleton*.
%
%      H = READYGUI returns the handle to a new READYGUI or the handle to
%      the existing singleton*.
%
%      READYGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in READYGUI.M with the given input arguments.
%
%      READYGUI('Property','Value',...) creates a new READYGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before readygui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to readygui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help readygui

% Last Modified by GUIDE v2.5 18-Jul-2012 20:42:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @readygui_OpeningFcn, ...
                   'gui_OutputFcn',  @readygui_OutputFcn, ...
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


% --- Executes just before readygui is made visible.
function readygui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to readygui (see VARARGIN)

% Choose default command line output for readygui
%handles.output = hObject;
handles.output=hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes readygui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = readygui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% --- Executes during object creation, after setting all properties.
function redlight_CreateFcn(hObject, eventdata, handles)
% hObject    handle to redlight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
