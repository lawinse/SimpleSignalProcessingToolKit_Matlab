function varargout = CDS_CT_sym(varargin)
% CDS_CT_SYM MATLAB code for CDS_CT_sym.fig
%      CDS_CT_SYM, by itself, creates a new CDS_CT_SYM or raises the existing
%      singleton*.
%
%      H = CDS_CT_SYM returns the handle to a new CDS_CT_SYM or the handle to
%      the existing singleton*.
%
%      CDS_CT_SYM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CDS_CT_SYM.M with the given input arguments.
%
%      CDS_CT_SYM('Property','Value',...) creates a new CDS_CT_SYM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CDS_CT_sym_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CDS_CT_sym_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CDS_CT_sym

% Last Modified by GUIDE v2.5 28-Jun-2015 16:31:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CDS_CT_sym_OpeningFcn, ...
                   'gui_OutputFcn',  @CDS_CT_sym_OutputFcn, ...
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


% --- Executes just before CDS_CT_sym is made visible.
function CDS_CT_sym_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to CDS_CT_sym (see VARARGIN)

% Choose default command line output for CDS_CT_sym
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes CDS_CT_sym wait for user response (see UIRESUME)
% uiwait(handles.figure1);
initialize_gui(hObject, handles, false);

% --- Outputs from this function are returned to the command line.
function varargout = CDS_CT_sym_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Cal.
function Cal_Callback(hObject, eventdata, handles)
% hObject    handle to Cal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
[y] = ct_Sym_plot(handles.metricdata.f,handles.metricdata.xl,handles.metricdata.xr);
catch 
    msgbox('Something wrong happended! Sorry!');
end



function input1_Callback(hObject, eventdata, handles)
% hObject    handle to input1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str = get(hObject, 'String');
if isempty(str)
    set(hObject, 'String', '');
    errordlg('Input must be a expression string','Error');
end
handles.metricdata.f = str;
guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of input1 as text
%        eval(get(hObject,'String')) returns contents of input1 as a double


% --- Executes during object creation, after setting all properties.
function input1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function input2_Callback(hObject, eventdata, handles)
% hObject    handle to input2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
xl = eval(get(hObject, 'String'));
if isnan(xl)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
% Save the new density value
handles.metricdata.xl = xl;
guidata(hObject,handles)
% Hints: get(hObject,'String') returns contents of input2 as text
%        eval(get(hObject,'String')) returns contents of input2 as a double


% --- Executes during object creation, after setting all properties.
function input2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function input3_Callback(hObject, eventdata, handles)
% hObject    handle to input3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
xr = eval(get(hObject, 'String'));
if isnan(xr)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
% Save the new density value
handles.metricdata.xr = xr;
guidata(hObject,handles)
% Hints: get(hObject,'String') returns contents of input3 as text
%        eval(get(hObject,'String')) returns contents of input3 as a double


% --- Executes during object creation, after setting all properties.
function input3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input3 (see GCBO)
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

handles.metricdata.f = '';
handles.metricdata.xl  = 0;
handles.metricdata.xr  = 0;

set(handles.input1, 'String', handles.metricdata.f);
set(handles.input2,  'String', handles.metricdata.xl);
set(handles.input3, 'String', handles.metricdata.xr);

% Update handles structure
guidata(handles.figure1, handles);
