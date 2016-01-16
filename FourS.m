function varargout = FourS(varargin)
% FOURS MATLAB code for FourS.fig
%      FOURS, by itself, creates a new FOURS or raises the existing
%      singleton*.
%
%      H = FOURS returns the handle to a new FOURS or the handle to
%      the existing singleton*.
%
%      FOURS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FOURS.M with the given input arguments.
%
%      FOURS('Property','Value',...) creates a new FOURS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FourS_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FourS_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FourS

% Last Modified by GUIDE v2.5 19-Jun-2015 01:40:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FourS_OpeningFcn, ...
                   'gui_OutputFcn',  @FourS_OutputFcn, ...
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


% --- Executes just before FourS is made visible.
function FourS_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FourS (see VARARGIN)

% Choose default command line output for FourS
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

initialize_gui(hObject, handles, false);
% UIWAIT makes FourS wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = FourS_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function Input0_Callback(hObject, eventdata, handles)
% hObject    handle to Input0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str = get(hObject, 'String');
if isempty(str)
    set(hObject, 'String', '');
    errordlg('Input must be a expression string','Error');
end
handles.metricdata.str = str;
guidata(hObject, handles)
% Hints: get(hObject,'String') returns contents of Input0 as text
%        eval(get(hObject,'String')) returns contents of Input0 as a double


% --- Executes during object creation, after setting all properties.
function Input0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Input0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Input1_Callback(hObject, eventdata, handles)
% hObject    handle to Input1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Tl = eval(get(hObject, 'String'));
if isnan(Tl)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
handles.metricdata.Tl = Tl;
guidata(hObject,handles)
% Hints: get(hObject,'String') returns contents of Input1 as text
%        eval(get(hObject,'String')) returns contents of Input1 as a double


% --- Executes during object creation, after setting all properties.
function Input1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Input1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Input2_Callback(hObject, eventdata, handles)
% hObject    handle to Input2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Tr = eval(get(hObject, 'String'));
if isnan(Tr)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
handles.metricdata.Tr = Tr;
guidata(hObject,handles)
% Hints: get(hObject,'String') returns contents of Input2 as text
%        eval(get(hObject,'String')) returns contents of Input2 as a double


% --- Executes during object creation, after setting all properties.
function Input2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Input2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Input3_Callback(hObject, eventdata, handles)
% hObject    handle to Input3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
N = eval(get(hObject, 'String'));
if isnan(N)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
handles.metricdata.N = N;
guidata(hObject,handles)
% Hints: get(hObject,'String') returns contents of Input3 as text
%        eval(get(hObject,'String')) returns contents of Input3 as a double


% --- Executes during object creation, after setting all properties.
function Input3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Input3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Confirm.
function Confirm_Callback(hObject, eventdata, handles)
% hObject    handle to Confirm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
[FS, a0, an] = FourierS(sym(handles.metricdata.str), handles.metricdata.Tl, handles.metricdata.Tr, handles.metricdata.N);
symdisp(FS);
set(handles.FS, 'String', char(FS));
catch 
    msgbox('Something wrong happended! Sorry!');
end

function initialize_gui(fig_handle, handles, isreset)
% If the metricdata field is present and the reset flag is false, it means
% we are we are just re-initializing a GUI by calling it from the cmd line
% while it is up. So, bail out as we dont want to reset the data.
if isfield(handles, 'metricdata') && ~isreset
    return;
end

handles.metricdata.str = '';
handles.metricdata.Tl = 0;
handles.metricdata.Tr = 0;
handles.metricdata.N = 0;

set(handles.Input0, 'String', handles.metricdata.str);
set(handles.Input1, 'String', handles.metricdata.Tl);
set(handles.Input2, 'String', handles.metricdata.Tr);
set(handles.Input3, 'String', handles.metricdata.N);
set(handles.FS, 'String', 0);

% Update handles structure
guidata(handles.figure1, handles);
