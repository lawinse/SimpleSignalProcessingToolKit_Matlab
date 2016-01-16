function varargout = CDS_CT_exp(varargin)
% CDS_CT_EXP MATLAB code for CDS_CT_exp.fig
%      CDS_CT_EXP, by itself, creates a new CDS_CT_EXP or raises the existing
%      singleton*.
%
%      H = CDS_CT_EXP returns the handle to a new CDS_CT_EXP or the handle to
%      the existing singleton*.
%
%      CDS_CT_EXP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CDS_CT_EXP.M with the given input arguments.
%
%      CDS_CT_EXP('Property','Value',...) creates a new CDS_CT_EXP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CDS_CT_exp_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CDS_CT_exp_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CDS_CT_exp

% Last Modified by GUIDE v2.5 29-Jun-2015 13:08:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CDS_CT_exp_OpeningFcn, ...
                   'gui_OutputFcn',  @CDS_CT_exp_OutputFcn, ...
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


% --- Executes just before CDS_CT_exp is made visible.
function CDS_CT_exp_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to CDS_CT_exp (see VARARGIN)

% Choose default command line output for CDS_CT_exp
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

initialize_gui(hObject, handles, false);

% UIWAIT makes CDS_CT_exp wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = CDS_CT_exp_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function Input01_Callback(hObject, eventdata, handles)
% hObject    handle to Input01 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x0 = eval(get(hObject, 'String'));
if isnan(x0)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
% Save the new density value
handles.metricdata.x0 = x0;
guidata(hObject,handles)
% Hints: get(hObject,'String') returns contents of Input01 as text
%        eval(get(hObject,'String')) returns contents of Input01 as a double


% --- Executes during object creation, after setting all properties.
function Input01_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Input01 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Input02_Callback(hObject, eventdata, handles)
% hObject    handle to Input02 (see GCBO)
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
% Hints: get(hObject,'String') returns contents of Input02 as text
%        eval(get(hObject,'String')) returns contents of Input02 as a double


% --- Executes during object creation, after setting all properties.
function Input02_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Input02 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Input03_Callback(hObject, eventdata, handles)
% hObject    handle to Input03 (see GCBO)
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
% Hints: get(hObject,'String') returns contents of Input03 as text
%        eval(get(hObject,'String')) returns contents of Input03 as a double


% --- Executes during object creation, after setting all properties.
function Input03_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Input03 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Calculate.
function Calculate_Callback(hObject, eventdata, handles)
% hObject    handle to Calculate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%[y,x,p] = ct_step_plot(handles.metricdata.x0,handles.metricdata.xl,handles.metricdata.xr);
try
[y1] = ct_exp_plot(handles.metricdata.c0,handles.metricdata.a,handles.metricdata.b,handles.metricdata.xl,handles.metricdata.xr,handles.metricdata.x0);
catch 
    msgbox('Something wrong happended! Sorry!');
end
%CallPlot(handles.metricdata.x0,handles.metricdata.xl,handles.metricdata.xr,hObject);

%function CallPlot(x0,xl,xr,hObject)
%open('demo20150529.fig');
%h = guihandles;
%setappdata(h.Out,'PlotX0',x0);
%setappdata(h.Out,'PlotXL',xl);
%setappdata(h.Out,'PlotXR',xr);
%fprintf('hello');
%run(demo20150529);

function initialize_gui(fig_handle, handles, isreset)
% If the metricdata field is present and the reset flag is false, it means
% we are we are just re-initializing a GUI by calling it from the cmd line
% while it is up. So, bail out as we dont want to reset the data.
if isfield(handles, 'metricdata') && ~isreset
    return;
end

handles.metricdata.x0 = 0;
handles.metricdata.xl  = 0;
handles.metricdata.xr  = 0;
handles.metricdata.c0  = 1;
handles.metricdata.a  = 1;
handles.metricdata.b  = 0;

set(handles.Input01, 'String', handles.metricdata.x0);
set(handles.Input02,  'String', handles.metricdata.xl);
set(handles.Input03, 'String', handles.metricdata.xr);
set(handles.c0, 'String', handles.metricdata.c0);
set(handles.a, 'String', handles.metricdata.a);
set(handles.b, 'String', handles.metricdata.b);

% Update handles structure
guidata(handles.figure1, handles);



function c0_Callback(hObject, eventdata, handles)
% hObject    handle to c0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
c0 = eval(get(hObject, 'String'));
if isnan(c0)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
% Save the new density value
handles.metricdata.c0 = c0;
guidata(hObject,handles)
% Hints: get(hObject,'String') returns contents of c0 as text
%        eval(get(hObject,'String')) returns contents of c0 as a double


% --- Executes during object creation, after setting all properties.
function c0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function a_Callback(hObject, eventdata, handles)
% hObject    handle to a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = eval(get(hObject, 'String'));
if isnan(a)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
% Save the new density value
handles.metricdata.a = a;
guidata(hObject,handles)
% Hints: get(hObject,'String') returns contents of a as text
%        eval(get(hObject,'String')) returns contents of a as a double


% --- Executes during object creation, after setting all properties.
function a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function b_Callback(hObject, eventdata, handles)
% hObject    handle to b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
b = eval(get(hObject, 'String'));
if isnan(b)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
% Save the new density value
handles.metricdata.b = b;
guidata(hObject,handles)
% Hints: get(hObject,'String') returns contents of b as text
%        eval(get(hObject,'String')) returns contents of b as a double


% --- Executes during object creation, after setting all properties.
function b_CreateFcn(hObject, eventdata, handles)
% hObject    handle to b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
