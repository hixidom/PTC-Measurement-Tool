function varargout = resultsgui(varargin)
% RESULTSGUI MATLAB code for resultsgui.fig
%      RESULTSGUI, by itself, creates a new RESULTSGUI or raises the existing
%      singleton*.
%
%      H = RESULTSGUI returns the handle to a new RESULTSGUI or the handle to
%      the existing singleton*.
%
%      RESULTSGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RESULTSGUI.M with the given input arguments.
%
%      RESULTSGUI('Property','Value',...) creates a new RESULTSGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before resultsgui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to resultsgui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help resultsgui

% Last Modified by GUIDE v2.5 30-Jul-2012 16:50:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @resultsgui_OpeningFcn, ...
                   'gui_OutputFcn',  @resultsgui_OutputFcn, ...
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


% --- Executes just before resultsgui is made visible.
function resultsgui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to resultsgui (see VARARGIN)

% Choose default command line output for resultsgui
handles.output = hObject;
vars=evalin('base','vars');
clear vars.atfreq vars.filter;
vars.atfreq(1:vars.trialnum-1)=vars.tf+(vars.trialno(1:(vars.trialnum-1))+vars.trialno(2:vars.trialnum))/2;
vars.filter(1:(vars.trialnum-1))=(vars.trialthresh(2:vars.trialnum)-vars.trialthresh(1:(vars.trialnum-1)))/vars.ivchange;
vars.relwidth=(vars.atfreq-vars.tf)/vars.tf;
assignin('base','vars',vars);
    
axes(handles.axes1);
plot(vars.tf+(0:(vars.trialnum-1))*vars.ivchange,vars.trialthresh);
set(handles.axes1,'fontsize',12);
title('Raw Data')
xlabel('f (Hz)');
ylabel('Threshold intensity');

axes(handles.axes2);
plot(vars.relwidth,log10(-vars.filter));
set(handles.axes2,'fontsize',12);
title('Filter Shape')
xlabel('(f-f_{tone})/f_{tone}');
ylabel('Log_{10}(filter)');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes resultsgui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = resultsgui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
