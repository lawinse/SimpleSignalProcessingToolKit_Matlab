function varargout = Sampl_CT_sym(varargin)
% SAMPL_CT_SYM MATLAB code for Sampl_CT_sym.fig
%      SAMPL_CT_SYM, by itself, creates a new SAMPL_CT_SYM or raises the existing
%      singleton*.
%
%      H = SAMPL_CT_SYM returns the handle to a new SAMPL_CT_SYM or the handle to
%      the existing singleton*.
%
%      SAMPL_CT_SYM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SAMPL_CT_SYM.M with the given input arguments.
%
%      SAMPL_CT_SYM('Property','Value',...) creates a new SAMPL_CT_SYM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Sampl_CT_sym_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Sampl_CT_sym_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Sampl_CT_sym

% Last Modified by GUIDE v2.5 27-Jun-2015 23:34:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Sampl_CT_sym_OpeningFcn, ...
                   'gui_OutputFcn',  @Sampl_CT_sym_OutputFcn, ...
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


% --- Executes just before Sampl_CT_sym is made visible.
function Sampl_CT_sym_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Sampl_CT_sym (see VARARGIN)

% Choose default command line output for Sampl_CT_sym
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

initialize_gui(hObject, handles, false);
% UIWAIT makes Sampl_CT_sym wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Sampl_CT_sym_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output



% --- Executes on button press in Confirm.
function Confirm_Callback(hObject, eventdata, handles)
% hObject    handle to Confirm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
xl = handles.metricdata.xl;
xr = handles.metricdata.xr;
syms t;
y = sym(handles.metricdata.str);
y0 = subs(y,t,xl:0.01:xr);
x0 = xl:0.01:xr;
try
    [ya,xa Ya,Xa] = LPF(double(y0),x0,handles.metricdata.lpf_n,handles.metricdata.lpf_l,handles.metricdata.lpf_r,handles.metricdata.lpf_co);
catch 
    msgbox('Something wrong happended! Sorry!');
end



function input_LPF_n_Callback(hObject, eventdata, handles)
% hObject    handle to input_LPF_n (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
lpf_n = eval(get(hObject, 'String'));
if isnan(lpf_n)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
handles.metricdata.lpf_n = lpf_n;
guidata(hObject,handles);
% Hints: get(hObject,'String') returns contents of input_LPF_n as text
%        eval(get(hObject,'String')) returns contents of input_LPF_n as a double


% --- Executes during object creation, after setting all properties.
function input_LPF_n_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input_LPF_n (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function input_LPF_l_Callback(hObject, eventdata, handles)
% hObject    handle to input_LPF_l (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
lpf_l = eval(get(hObject, 'String'));
if isnan(lpf_l)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
handles.metricdata.lpf_l = lpf_l;
guidata(hObject,handles);
% Hints: get(hObject,'String') returns contents of input_LPF_l as text
%        eval(get(hObject,'String')) returns contents of input_LPF_l as a double


% --- Executes during object creation, after setting all properties.
function input_LPF_l_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input_LPF_l (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function input_LPF_r_Callback(hObject, eventdata, handles)
% hObject    handle to input_LPF_r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
lpf_r = eval(get(hObject, 'String'));
if isnan(lpf_r)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
handles.metricdata.lpf_r = lpf_r;
guidata(hObject,handles);
% Hints: get(hObject,'String') returns contents of input_LPF_r as text
%        eval(get(hObject,'String')) returns contents of input_LPF_r as a double


% --- Executes during object creation, after setting all properties.
function input_LPF_r_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input_LPF_r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function input_LPF_Co_Callback(hObject, eventdata, handles)
% hObject    handle to input_LPF_Co (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
lpf_co = eval(get(hObject, 'String'));
if isnan(lpf_co)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
handles.metricdata.lpf_co = lpf_co;
guidata(hObject,handles);
% Hints: get(hObject,'String') returns contents of input_LPF_Co as text
%        eval(get(hObject,'String')) returns contents of input_LPF_Co as a double


% --- Executes during object creation, after setting all properties.
function input_LPF_Co_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input_LPF_Co (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function inputStr_Callback(hObject, eventdata, handles)
% hObject    handle to inputStr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str = get(hObject, 'String');
if isempty(str)
    set(hObject, 'String', '');
    errordlg('Input must be a expression string','Error');
end
handles.metricdata.str = str;
guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of inputStr as text
%        eval(get(hObject,'String')) returns contents of inputStr as a double


% --- Executes during object creation, after setting all properties.
function inputStr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputStr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




function inputXL_Callback(hObject, eventdata, handles)
% hObject    handle to inputXL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
xl = eval(get(hObject, 'String'));
if isnan(xl)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
handles.metricdata.xl = xl;
guidata(hObject,handles);
% Hints: get(hObject,'String') returns contents of inputXL as text
%        eval(get(hObject,'String')) returns contents of inputXL as a double


% --- Executes during object creation, after setting all properties.
function inputXL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputXL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inputXR_Callback(hObject, eventdata, handles)
% hObject    handle to inputXR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
xr = eval(get(hObject, 'String'));
if isnan(xr)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
handles.metricdata.xr = xr;
guidata(hObject,handles);
% Hints: get(hObject,'String') returns contents of inputXR as text
%        eval(get(hObject,'String')) returns contents of inputXR as a double


% --- Executes during object creation, after setting all properties.
function inputXR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputXR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function initialize_gui(fig_handle, handles, isreset)
% If the metricdata field is present and the reset flag is false, it means
% we are we are just re-initializing a GUI by calling it from the cmd line
% while it is up. So, bail out as we dont want to reset the data.
if isfield(handles, 'metricdata') && ~isreset
    return;
end

handles.metricdata.str = '';
handles.metricdata.xl = 0;
handles.metricdata.xr = 0;
handles.metricdata.lpf_n  = 1;
handles.metricdata.lpf_l  = 0;
handles.metricdata.lpf_r  = 0;
handles.metricdata.lpf_co  = 1;

set(handles.inputStr, 'String', handles.metricdata.str);
set(handles.inputXL, 'String', handles.metricdata.xl);
set(handles.inputXR, 'String', handles.metricdata.xr);
set(handles.input_LPF_n, 'String', handles.metricdata.lpf_n);
set(handles.input_LPF_l, 'String', handles.metricdata.lpf_l);
set(handles.input_LPF_r, 'String', handles.metricdata.lpf_r);
set(handles.input_LPF_Co, 'String', handles.metricdata.lpf_co);

% Update handles structure
guidata(handles.figure1, handles);
