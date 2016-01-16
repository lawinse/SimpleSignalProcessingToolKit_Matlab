function varargout = LnZ_Z(varargin)
% LNZ_Z MATLAB code for LnZ_Z.fig
%      LNZ_Z, by itself, creates a new LNZ_Z or raises the existing
%      singleton*.
%
%      H = LNZ_Z returns the handle to a new LNZ_Z or the handle to
%      the existing singleton*.
%
%      LNZ_Z('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LNZ_Z.M with the given input arguments.
%
%      LNZ_Z('Property','Value',...) creates a new LNZ_Z or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before LnZ_Z_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to LnZ_Z_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help LnZ_Z

% Last Modified by GUIDE v2.5 28-Jun-2015 16:46:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @LnZ_Z_OpeningFcn, ...
                   'gui_OutputFcn',  @LnZ_Z_OutputFcn, ...
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


% --- Executes just before LnZ_Z is made visible.
function LnZ_Z_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to LnZ_Z (see VARARGIN)

% Choose default command line output for LnZ_Z
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

initialize_gui(hObject, handles, false);
% UIWAIT makes LnZ_Z wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = LnZ_Z_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function inputZero_Callback(hObject, eventdata, handles)
% hObject    handle to inputZero (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
zeros = get(hObject, 'String');
if isempty(zeros)
    set(hObject, 'String', '');
    errordlg('Input must be a array','Error');
end
handles.metricdata.zeros = zeros;
guidata(hObject,handles)
% Hints: get(hObject,'String') returns contents of inputZero as text
%        eval(get(hObject,'String')) returns contents of inputZero as a double


% --- Executes during object creation, after setting all properties.
function inputZero_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputZero (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inputPole_Callback(hObject, eventdata, handles)
% hObject    handle to inputPole (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
poles = get(hObject, 'String');
if isempty(poles)
    set(hObject, 'String', '');
    errordlg('Input must be a array','Error');
end
handles.metricdata.poles = poles;
guidata(hObject,handles)
% Hints: get(hObject,'String') returns contents of inputPole as text
%        eval(get(hObject,'String')) returns contents of inputPole as a double


% --- Executes during object creation, after setting all properties.
function inputPole_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputPole (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in isC.
function isC_Callback(hObject, eventdata, handles)
% hObject    handle to isC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.metricdata.isCa = get(hObject, 'Value');
guidata(handles.figure1, handles);
% Hint: get(hObject,'Value') returns toggle state of isC



function inputNL_Callback(hObject, eventdata, handles)
% hObject    handle to inputNL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
nl = eval(get(hObject, 'String'));
if isnan(nl)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
handles.metricdata.nl = nl;
guidata(hObject,handles)
% Hints: get(hObject,'String') returns contents of inputNL as text
%        eval(get(hObject,'String')) returns contents of inputNL as a double


% --- Executes during object creation, after setting all properties.
function inputNL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputNL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inputNR_Callback(hObject, eventdata, handles)
% hObject    handle to inputNR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
nr = eval(get(hObject, 'String'));
if isnan(nr)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
handles.metricdata.nr = nr;
guidata(hObject,handles)
% Hints: get(hObject,'String') returns contents of inputNR as text
%        eval(get(hObject,'String')) returns contents of inputNR as a double


% --- Executes during object creation, after setting all properties.
function inputNR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputNR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inputScal_Callback(hObject, eventdata, handles)
% hObject    handle to inputScal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
scal = eval(get(hObject, 'String'));
if isnan(scal)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
handles.metricdata.scal = scal;
guidata(hObject,handles)
% Hints: get(hObject,'String') returns contents of inputScal as text
%        eval(get(hObject,'String')) returns contents of inputScal as a double


% --- Executes during object creation, after setting all properties.
function inputScal_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputScal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Comfirm.
function Comfirm_Callback(hObject, eventdata, handles)
% hObject    handle to Comfirm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA
zero = eval(handles.metricdata.zeros);
pole = eval(handles.metricdata.poles);
handles.metricdata.isCa;
[ht_n, Hz, zz] = ZT(zero, pole, handles.metricdata.isCa, handles.metricdata.nl, handles.metricdata.nr, handles.metricdata.scal);


function initialize_gui(fig_handle, handles, isreset)
% If the metricdata field is present and the reset flag is false, it means
% we are we are just re-initializing a GUI by calling it from the cmd line
% while it is up. So, bail out as we dont want to reset the data.
if isfield(handles, 'metricdata') && ~isreset
    return;
end

handles.metricdata.zeros = '';
handles.metricdata.poles = '';
handles.metricdata.en = '';
handles.metricdata.ez = '';
handles.metricdata.isCa = 0;
handles.metricdata.nl = 0;
handles.metricdata.nr = 0;
handles.metricdata.scal = 1;

set(handles.inputZero, 'String', handles.metricdata.zeros);
set(handles.inputPole, 'String', handles.metricdata.poles);
set(handles.inputEn, 'String', handles.metricdata.en);
set(handles.inputEz, 'String', handles.metricdata.ez);
set(handles.isC, 'Value', handles.metricdata.isCa);
set(handles.inputNL, 'String', handles.metricdata.nl);
set(handles.inputNR, 'String', handles.metricdata.nr);
set(handles.inputScal, 'String', handles.metricdata.scal);

% Update handles structure
guidata(handles.figure1, handles);



function inputEz_Callback(hObject, eventdata, handles)
% hObject    handle to inputEz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ez = get(hObject, 'String');
if isempty(ez)
    set(hObject, 'String', '');
    errordlg('Input must be a expression','Error');
end
handles.metricdata.ez = ez;
guidata(hObject,handles)
% Hints: get(hObject,'String') returns contents of inputEz as text
%        eval(get(hObject,'String')) returns contents of inputEz as a double


% --- Executes during object creation, after setting all properties.
function inputEz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputEz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function inputEn_Callback(hObject, eventdata, handles)
% hObject    handle to inputEn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
en = get(hObject, 'String');
if isempty(en)
    set(hObject, 'String', '');
    errordlg('Input must be a expression','Error');
end
handles.metricdata.en = en;
guidata(hObject,handles)
% Hints: get(hObject,'String') returns contents of inputEn as text
%        eval(get(hObject,'String')) returns contents of inputEn as a double


% --- Executes during object creation, after setting all properties.
function inputEn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputEn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Confirm_iZ.
function Confirm_iZ_Callback(hObject, eventdata, handles)
% hObject    handle to Confirm_iZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[x] = iZtrans(handles.metricdata.ez);
symdisp(x);
set(handles.Result_iZ, 'String', char(x));


% --- Executes on button press in Confirm_Z.
function Confirm_Z_Callback(hObject, eventdata, handles)
% hObject    handle to Confirm_Z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[X] = Ztrans_(handles.metricdata.en);
symdisp(X);
set(handles.Result_Z, 'String', char(X));
