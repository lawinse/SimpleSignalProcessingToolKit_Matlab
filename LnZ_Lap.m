function varargout = LnZ_Lap(varargin)
% LNZ_LAP MATLAB code for LnZ_Lap.fig
%      LNZ_LAP, by itself, creates a new LNZ_LAP or raises the existing
%      singleton*.
%
%      H = LNZ_LAP returns the handle to a new LNZ_LAP or the handle to
%      the existing singleton*.
%
%      LNZ_LAP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LNZ_LAP.M with the given input arguments.
%
%      LNZ_LAP('Property','Value',...) creates a new LNZ_LAP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before LnZ_Lap_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to LnZ_Lap_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help LnZ_Lap

% Last Modified by GUIDE v2.5 28-Jun-2015 16:30:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @LnZ_Lap_OpeningFcn, ...
                   'gui_OutputFcn',  @LnZ_Lap_OutputFcn, ...
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


% --- Executes just before LnZ_Lap is made visible.
function LnZ_Lap_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to LnZ_Lap (see VARARGIN)

% Choose default command line output for LnZ_Lap
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

initialize_gui(hObject, handles, false);
% UIWAIT makes LnZ_Lap wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = LnZ_Lap_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function inputAk_Callback(hObject, eventdata, handles)
% hObject    handle to inputAk (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ak = get(hObject, 'String');
if isempty(ak)
    set(hObject, 'String', '');
    errordlg('Input must be a array','Error');
end
handles.metricdata.ak = ak;
guidata(hObject,handles)
% Hints: get(hObject,'String') returns contents of inputAk as text
%        eval(get(hObject,'String')) returns contents of inputAk as a double


% --- Executes during object creation, after setting all properties.
function inputAk_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputAk (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function inputBk_Callback(hObject, eventdata, handles)
% hObject    handle to inputBk (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bk = get(hObject, 'String');
if isempty(bk)
    set(hObject, 'String', '');
    errordlg('Input must be a array','Error');
end
handles.metricdata.bk = bk;
guidata(hObject,handles)
% Hints: get(hObject,'String') returns contents of inputBk as text
%        eval(get(hObject,'String')) returns contents of inputBk as a double


% --- Executes during object creation, after setting all properties.
function inputBk_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputBk (see GCBO)
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


% --- Executes on button press in Confirm.
function Confirm_Callback(hObject, eventdata, handles)
% hObject    handle to Confirm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ak = eval(handles.metricdata.ak);
bk = eval(handles.metricdata.bk);
[ft,Hs] = LCCDE_LT(ak, bk, handles.metricdata.isCa);


function initialize_gui(fig_handle, handles, isreset)
% If the metricdata field is present and the reset flag is false, it means
% we are we are just re-initializing a GUI by calling it from the cmd line
% while it is up. So, bail out as we dont want to reset the data.
if isfield(handles, 'metricdata') && ~isreset
    return;
end

handles.metricdata.ak = '';
handles.metricdata.bk = '';
handles.metricdata.et = '';
handles.metricdata.es = '';
handles.metricdata.isCa = 0;

set(handles.inputAk, 'String', handles.metricdata.ak);
set(handles.inputBk, 'String', handles.metricdata.bk);
set(handles.inputEt, 'String', handles.metricdata.et);
set(handles.inputEs, 'String', handles.metricdata.es);
set(handles.isC, 'Value', handles.metricdata.isCa);

% Update handles structure
guidata(handles.figure1, handles);



function inputEt_Callback(hObject, eventdata, handles)
% hObject    handle to inputEt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
et = get(hObject, 'String');
if isempty(et)
    set(hObject, 'String', '');
    errordlg('Input must be a expression','Error');
end
handles.metricdata.et = et;
guidata(hObject,handles)
% Hints: get(hObject,'String') returns contents of inputEt as text
%        eval(get(hObject,'String')) returns contents of inputEt as a double


% --- Executes during object creation, after setting all properties.
function inputEt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputEt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Confirm_L.
function Confirm_L_Callback(hObject, eventdata, handles)
% hObject    handle to Confirm_L (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[Lx] = Laplace_( handles.metricdata.et );
symdisp(Lx);
set(handles.Result_L, 'String', char(Lx));



function inputEs_Callback(hObject, eventdata, handles)
% hObject    handle to inputEs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
es = get(hObject, 'String');
if isempty(es)
    set(hObject, 'String', '');
    errordlg('Input must be a expression','Error');
end
handles.metricdata.es = es;
guidata(hObject,handles)
% Hints: get(hObject,'String') returns contents of inputEs as text
%        eval(get(hObject,'String')) returns contents of inputEs as a double


% --- Executes during object creation, after setting all properties.
function inputEs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputEs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Confirm_iL.
function Confirm_iL_Callback(hObject, eventdata, handles)
% hObject    handle to Confirm_iL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[x] = iLaplace_(handles.metricdata.es);
symdisp(x);
set(handles.Result_iL, 'String', char(x));
