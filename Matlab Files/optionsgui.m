function varargout = optionsgui(varargin)
% OPTIONSGUI MATLAB code for optionsgui.fig
%      OPTIONSGUI, by itself, creates a new OPTIONSGUI or raises the existing
%      singleton*.
%
%      H = OPTIONSGUI returns the handle to a new OPTIONSGUI or the handle to
%      the existing singleton*.
%
%      OPTIONSGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OPTIONSGUI.M with the given input arguments.
%
%      OPTIONSGUI('Property','Value',...) creates a new OPTIONSGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before optionsgui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to optionsgui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help optionsgui

% Last Modified by GUIDE v2.5 09-Jan-2013 02:20:52

% Begin initialization code - DO NOT EDIT

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @optionsgui_OpeningFcn, ...
                   'gui_OutputFcn',  @optionsgui_OutputFcn, ...
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


% --- Executes just before optionsgui is made visible.
function optionsgui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to optionsgui (see VARARGIN)

% Choose default command line output for optionsgui
handles.output=hObject;
t=0:1/44100:10;
handles.testtone=sin(2*pi*500*t)/4;
t=0:1/44100:1;
handles.threshapproxtone=taper(sin(2*pi*500*t))/10;
handles.threshapproxnoise=sin(2*pi*20*t);
for i=1:1000
    handles.threshapproxnoise=handles.threshapproxnoise+sin(2*pi*(20+i)*t+rand*2*pi);
end
handles.threshapproxnoise=taper(handles.threshapproxnoise)/(10*max(handles.threshapproxnoise));

set(handles.gensoundstext,'Visible','Off');
set(handles.testcount,'Visible','Off');
set(handles.testnum,'Visible','Off');

vars=evalin('base','vars');
vars.Fs=44100;
assignin('base','vars',vars);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes optionsgui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = optionsgui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on selection change in ear.
function ear_Callback(hObject, eventdata, handles)
% hObject    handle to ear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
vars=evalin('base','vars');
vars.eartype=get(hObject,'Value');%1=left, 2=right, 3=both
assignin('base','vars',vars);
% Hints: contents = cellstr(get(hObject,'String')) returns ear contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ear


% --- Executes during object creation, after setting all properties.
function ear_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
vars=evalin('base','vars');
vars.eartype=1;
assignin('base','vars',vars);
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in noisetype.
function noisetype_Callback(hObject, eventdata, handles)
% hObject    handle to noisetype (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
vars=evalin('base','vars');
vars.noisetype=get(hObject,'Value');
assignin('base','vars',vars);
% Hints: contents = cellstr(get(hObject,'String')) returns noisetype contents as cell array
%        contents{get(hObject,'Value')} returns selected item from noisetype


% --- Executes during object creation, after setting all properties.
function noisetype_CreateFcn(hObject, eventdata, handles)
% hObject    handle to noisetype (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
vars=evalin('base','vars');
vars.noisetype=1;
assignin('base','vars',vars);
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on noisetype and none of its controls.
function noisetype_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to noisetype (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in Next.
function Next_Callback(hObject, eventdata, handles)
% hObject    handle to Next (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.gensoundstext,'Visible','On');
vars=evalin('base','vars');

%the following is done so that certain parts of the gotonext.m script
%can be used for both types of test.
if vars.testtype==1
    vars.testnum=1;
end

vars.curblock=1;
vars.curtrial=1;
vars.cursubtrial=1;
vars.curtest=1;
vars.testdata=0;
vars.lastanswer=1;%1=correct. only to be used for testtype==1
vars.subtrialamp(1)=vars.threshapprox/10;
vars.trialno(1)=vars.no;
vars.dbstep=.2;
vars.trialthresh(vars.curtrial)=0;
vars.readydelay=-.8;

assignin('base','vars',vars);
tonegen;
noisegen;
set(handles.output,'Visible','Off');
set(introgui,'Visible','On');

function tonef_Callback(hObject, eventdata, handles)
% hObject    handle to tonef (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
vars=evalin('base','vars');
vars.tf=str2double(get(hObject,'String'));
assignin('base','vars',vars);
% Hints: get(hObject,'String') returns contents of tonef as text
%        str2double(get(hObject,'String')) returns contents of tonef as a double


% --- Executes during object creation, after setting all properties.
function tonef_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tonef (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
vars=evalin('base','vars');
vars.tf=str2double(get(hObject,'String'));
assignin('base','vars',vars);
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function blocklength_Callback(hObject, eventdata, handles)
% hObject    handle to blocklength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
vars=evalin('base','vars');
vars.T=str2double(get(hObject,'String'));
assignin('base','vars',vars);
% Hints: get(hObject,'String') returns contents of blocklength as text
%        str2double(get(hObject,'String')) returns contents of blocklength as a double


% --- Executes during object creation, after setting all properties.
function blocklength_CreateFcn(hObject, eventdata, handles)
% hObject    handle to blocklength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
vars=evalin('base','vars');
vars.T=str2double(get(hObject,'String'));
assignin('base','vars',vars);
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function notchoffset_Callback(hObject, eventdata, handles)
% hObject    handle to notchoffset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
vars=evalin('base','vars');
vars.no=str2double(get(hObject,'String'));
assignin('base','vars',vars);
% Hints: get(hObject,'String') returns contents of notchoffset as text
%        str2double(get(hObject,'String')) returns contents of notchoffset as a double


% --- Executes during object creation, after setting all properties.
function notchoffset_CreateFcn(hObject, eventdata, handles)
% hObject    handle to notchoffset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
vars=evalin('base','vars');
vars.no=str2double(get(hObject,'String'));
assignin('base','vars',vars);
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function notchwidth_Callback(hObject, eventdata, handles)
% hObject    handle to notchwidth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
vars=evalin('base','vars');
vars.nw=str2double(get(hObject,'String'));
assignin('base','vars',vars);
% Hints: get(hObject,'String') returns contents of notchwidth as text
%        str2double(get(hObject,'String')) returns contents of notchwidth as a double


% --- Executes during object creation, after setting all properties.
function notchwidth_CreateFcn(hObject, eventdata, handles)
% hObject    handle to notchwidth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
vars=evalin('base','vars');
vars.nw=str2double(get(hObject,'String'));
assignin('base','vars',vars);
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on key press with focus on figure1 or any of its controls.
function figure1_WindowKeyPressFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  structure with the following fields (see FIGURE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function gensoundstext_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gensoundstext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

function trials_Callback(hObject, eventdata, handles)
% hObject    handle to trials (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of trials as text
%        str2double(get(hObject,'String')) returns contents of trials as a double
vars=evalin('base','vars');
vars.trialnum=str2double(get(hObject,'String'));
assignin('base','vars',vars);

% --- Executes during object creation, after setting all properties.
function trials_CreateFcn(hObject, eventdata, handles)
% hObject    handle to trials (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
vars=evalin('base','vars');
vars.trialnum=str2double(get(hObject,'String'));
assignin('base','vars',vars);
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function indvarchange_Callback(hObject, eventdata, handles)
% hObject    handle to indvarchange (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of indvarchange as text
%        str2double(get(hObject,'String')) returns contents of indvarchange as a double
vars=evalin('base','vars');
vars.ivchange=str2double(get(hObject,'String'));
assignin('base','vars',vars);


% --- Executes during object creation, after setting all properties.
function indvarchange_CreateFcn(hObject, eventdata, handles)
% hObject    handle to indvarchange (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
vars=evalin('base','vars');
vars.ivchange=str2double(get(hObject,'String'));
assignin('base','vars',vars);
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over indvarchange.
function indvarchange_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to indvarchange (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function subtrials_Callback(hObject, eventdata, handles)
% hObject    handle to subtrials (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of subtrials as text
%        str2double(get(hObject,'String')) returns contents of subtrials as a double
vars=evalin('base','vars');
vars.subtrialnum=str2double(get(hObject,'String'));
assignin('base','vars',vars);


% --- Executes during object creation, after setting all properties.
function subtrials_CreateFcn(hObject, eventdata, handles)
% hObject    handle to subtrials (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
vars=evalin('base','vars');
vars.subtrialnum=str2double(get(hObject,'String'));
assignin('base','vars',vars);
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function testcount_Callback(hObject, eventdata, handles)
% hObject    handle to testcount (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of testcount as text
%        str2double(get(hObject,'String')) returns contents of testcount as a double
vars=evalin('base','vars');
vars.testnum=str2double(get(hObject,'String'));
assignin('base','vars',vars);

% --- Executes during object creation, after setting all properties.
function testcount_CreateFcn(hObject, eventdata, handles)
% hObject    handle to testcount (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
vars=evalin('base','vars');
vars.testnum=str2double(get(hObject,'String'));
assignin('base','vars',vars);
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in testsoundbut.
function testsoundbut_Callback(hObject, eventdata, handles)
% hObject    handle to testsoundbut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
sound(handles.testtone,44100);


function testsoundbox_Callback(hObject, eventdata, handles)
% hObject    handle to testsoundbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
vars=evalin('base','vars');
vars.dbcal=str2double(get(hObject,'String'));
assignin('base','vars',vars);
% Hints: get(hObject,'String') returns contents of testsoundbox as text
%        str2double(get(hObject,'String')) returns contents of testsoundbox as a double


% --- Executes during object creation, after setting all properties.
function testsoundbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to testsoundbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
vars=evalin('base','vars');
vars.dbcal=1;
assignin('base','vars',vars);
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function threshslider_Callback(hObject, eventdata, handles)
% hObject    handle to threshslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
vars=evalin('base','vars');
vars.threshapprox=get(hObject,'Value');
sound(handles.threshapproxtone*get(hObject,'Value')+handles.threshapproxnoise,44100);
assignin('base','vars',vars);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function threshslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to threshslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
vars=evalin('base','vars');
vars.threshapprox=.25;
assignin('base','vars',vars);
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on selection change in trialdelim.
function trialdelim_Callback(hObject, eventdata, handles)
% hObject    handle to trialdelim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
vars=evalin('base','vars');
vars.testtype=get(hObject,'Value');
if vars.testtype==1
    set(handles.testcount,'Visible','Off');
    set(handles.testnum,'Visible','Off');
    set(handles.subtrials,'Visible','On');
    set(handles.subtrialnum,'Visible','On');
elseif vars.testtype==2
    set(handles.subtrials,'Visible','Off');
    set(handles.subtrialnum,'Visible','Off');
    set(handles.testcount,'Visible','On');
    set(handles.testnum,'Visible','On');
end
assignin('base','vars',vars);
% Hints: contents = cellstr(get(hObject,'String')) returns trialdelim contents as cell array
%        contents{get(hObject,'Value')} returns selected item from trialdelim


% --- Executes during object creation, after setting all properties.
function trialdelim_CreateFcn(hObject, eventdata, handles)
% hObject    handle to trialdelim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
vars=evalin('base','vars');
vars.testtype=1;
assignin('base','vars',vars);
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in tonetype.
function tonetype_Callback(hObject, eventdata, handles)
% hObject    handle to tonetype (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
vars=evalin('base','vars');
vars.tonetype=get(hObject,'Value');
assignin('base','vars',vars);
% Hints: contents = cellstr(get(hObject,'String')) returns tonetype contents as cell array
%        contents{get(hObject,'Value')} returns selected item from tonetype


% --- Executes during object creation, after setting all properties.
function tonetype_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tonetype (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
vars=evalin('base','vars');
vars.tonetype=1;
assignin('base','vars',vars);
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in updateplotsbut.
function updateplotsbut_Callback(hObject, eventdata, handles)
% hObject    handle to updateplotsbut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tonegen;
noisegen;
vars=evalin('base','vars');
vars.Fs=44100;
vars.Ns=int32(vars.Fs*vars.T);

NFFT = 2^nextpow2(max(size(vars.tone))); % Next power of 2 from length of y
Y = fft(vars.tone,NFFT)/max(size(vars.tone));
f = (44100/2)*linspace(0,1,NFFT/2+1);
% Plot single-sided amplitude spectrum.
axes(handles.axes1);
xend=find(abs(Y(1:size(f,2)))>.001,1,'last');
plot(f(1:xend),2*abs(Y(1:xend)));
title('Amplitude spectrum of tone');
xlabel('Frequency (Hz)');
ylabel('Amplitude');

NFFT = 2^nextpow2(max(size(vars.norigin))); % Next power of 2 from length of y
Y = fft(vars.norigin,NFFT)/max(size(vars.norigin));
f = (44100/2)*linspace(0,1,NFFT/2+1);
% Plot single-sided amplitude spectrum.
axes(handles.axes2);
xend=find(abs(Y(1:size(f,2)))>.0001,1,'last');
plot(f(1:xend),2*abs(Y(1:xend)));
title('Amplitude spectrum of noise');
xlabel('Frequency (Hz)');
ylabel('Amplitude');



function noisespacing_Callback(hObject, eventdata, handles)
% hObject    handle to noisespacing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
vars=evalin('base','vars');
vars.nspacing=str2double(get(hObject,'String'));
assignin('base','vars',vars);
% Hints: get(hObject,'String') returns contents of noisespacing as text
%        str2double(get(hObject,'String')) returns contents of noisespacing as a double


% --- Executes during object creation, after setting all properties.
function noisespacing_CreateFcn(hObject, eventdata, handles)
% hObject    handle to noisespacing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
vars=evalin('base','vars');
vars.nspacing=str2double(get(hObject,'String'));
assignin('base','vars',vars);
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
