function varargout = CT_conv(varargin)
% CT_CONV MATLAB code for CT_conv.fig
%      CT_CONV, by itself, creates a new CT_CONV or raises the existing
%      singleton*.
%
%      H = CT_CONV returns the handle to a new CT_CONV or the handle to
%      the existing singleton*.
%
%      CT_CONV('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CT_CONV.M with the given input arguments.
%
%      CT_CONV('Property','Value',...) creates a new CT_CONV or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CT_conv_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CT_conv_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CT_conv

% Last Modified by GUIDE v2.5 28-Jun-2015 13:40:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CT_conv_OpeningFcn, ...
                   'gui_OutputFcn',  @CT_conv_OutputFcn, ...
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





function initialize_gui(fig_handle, handles, isreset)
% If the data field is present and the reset flag is false, it means
% we are we are just re-initializing a GUI by calling it from the cmd line
% while it is up. So, bail out as we dont want to reset the data.
if isfield(handles, 'data') && ~isreset
    return;
end
handles.data.type1 = 1;
handles.data.type2 = 1;
handles.data.co1 = 0;
handles.data.co2 = 0;
handles.data.a1 = 0;
handles.data.a2 = 0;
handles.data.b1 = 0;
handles.data.b2 = 0;
handles.data.tb1 = 0;
handles.data.tb2 = 0;
handles.data.tco1 = 0;
handles.data.l1 = 0;
handles.data.l2 = 0;
handles.data.r1 = 0;
handles.data.r2 = 0;

% Update handles structure
guidata(handles.figure1, handles);


% --- Executes just before CT_conv is made visible.
function CT_conv_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to CT_conv (see VARARGIN)

% Choose default command line output for CT_conv
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes CT_conv wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = CT_conv_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
flag = 1;
if handles.data.l1 >= handles.data.r1 || handles.data.l2 >= handles.data.r2
    errordlg('left bound must less than right bound','Error');
    flag = 0;
end
if handles.data.type1 == 1 && (handles.data.b1 <= handles.data.l1 || handles.data.b1 >= handles.data.r1)
    errordlg('interval must contains the impulse','Error');
    flag = 0;
end
if  handles.data.type1 == 1 && (handles.data.b1 <= handles.data.l2 || handles.data.b1 >= handles.data.r2)
    errordlg('interval must contains the impulse','Error');
    flag = 0;
end
if(flag == 1)
switch(handles.data.type1)
    case 1
        [y1, x1, p1] = ct_imp_plot_private(handles.data.b1, handles.data.l1, handles.data.r1, handles.data.co1,0);
    case 2
        [y1, x1, p1] = ct_step_plot_private(handles.data.b1, handles.data.l1, handles.data.r1, handles.data.co1, handles.data.a1,0);
    case 3
        [y1, x1, p1] = ct_Sa_plot_private(handles.data.b1, handles.data.l1, handles.data.r1, handles.data.a1,0);
    case 4
        [y1, x1, p1] = ct_Rec_plot_private(handles.data.tb1, handles.data.b1, handles.data.l1, handles.data.r1, 1,0);
    case 5
        [y1, x1] = ct_exp_plot_private(handles.data.co1, handles.data.a1, handles.data.b1, handles.data.l1, handles.data.r1,0,0);
end
switch(handles.data.type2)
    case 1
        [y2, x2, p2] = ct_imp_plot_private(handles.data.b2, handles.data.l2, handles.data.r2, handles.data.co2,0);
    case 2
        [y2, x2, p2] = ct_step_plot_private(handles.data.b2, handles.data.l2, handles.data.r2, handles.data.co2, handles.data.a2,0);
    case 3
        [y2, x2, p2] = ct_Sa_plot_private(handles.data.b2, handles.data.l2, handles.data.r2, handles.data.a2,0);
    case 4
        [y2, x2, p2] = ct_Rec_plot_private(handles.data.b2, handles.data.tb2,handles.data.l2, handles.data.r2, handles.data.co2,0);
    case 5
        [y2, x2] = ct_exp_plot_private(handles.data.co2, handles.data.a2, handles.data.b2, handles.data.l2, handles.data.r2,0,0);
end
try
[f, k, p] = ct_conv_private(y1,y2,x1,x2);
catch 
    msgbox('Something wrong happended! Sorry!');
end
end
  



% --- Executes during object creation, after setting all properties.
function r2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function l2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to l2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function co2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to co2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function b2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to b2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function a2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function a1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function tb1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tb1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function tco1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tco1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function l1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to l1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function r1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function text17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function tco1_Callback(hObject, eventdata, handles)
% hObject    handle to tco1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tco1 = eval(get(hObject, 'String'));
if isnan(tco1)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
handles.data.tco1 = tco1;
guidata(hObject,handles)
% Hints: get(hObject,'String') returns contents of tco1 as text
%        eval(get(hObject,'String')) returns contents of tco1 as a double



function a1_Callback(hObject, eventdata, handles)
% hObject    handle to a1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a1 = eval(get(hObject, 'String'));
if isnan(a1)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
handles.data.a1 = a1;
guidata(hObject,handles);
% Hints: get(hObject,'String') returns contents of a1 as text
%        eval(get(hObject,'String')) returns contents of 	 as a double



function tb1_Callback(hObject, eventdata, handles)
% hObject    handle to tb1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tb1 = eval(get(hObject, 'String'));
if isnan(tb1)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
handles.data.tb1 = tb1
guidata(hObject,handles);
% Hints: get(hObject,'String') returns contents of tb1 as text
%        eval(get(hObject,'String')) returns contents of tb1 as a double



function l1_Callback(hObject, eventdata, handles)
% hObject    handle to l1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
l1 = eval(get(hObject, 'String'));
if isnan(l1)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
handles.data.l1 = l1;
guidata(hObject,handles)
% Hints: get(hObject,'String') returns contents of l1 as text
%        eval(get(hObject,'String')) returns contents of l1 as a double



function r1_Callback(hObject, eventdata, handles)
% hObject    handle to r1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
r1 = eval(get(hObject, 'String'));
if isnan(r1)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
handles.data.r1 = r1;
guidata(hObject,handles)
% Hints: get(hObject,'String') returns contents of r1 as text
%        eval(get(hObject,'String')) returns contents of r1 as a double



function co2_Callback(hObject, eventdata, handles)
% hObject    handle to co2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
co2 = eval(get(hObject, 'String'));
if isnan(co2)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
handles.data.co2 = co2;
guidata(hObject,handles)
% Hints: get(hObject,'String') returns contents of co2 as text
%        eval(get(hObject,'String')) returns contents of co2 as a double



function a2_Callback(hObject, eventdata, handles)
% hObject    handle to a2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a2 = eval(get(hObject, 'String'));
if isnan(a2)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
handles.data.a2 = a2;
guidata(hObject,handles)
% Hints: get(hObject,'String') returns contents of a2 as text
%        eval(get(hObject,'String')) returns contents of a2 as a double



function b2_Callback(hObject, eventdata, handles)
% hObject    handle to b2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
b2 = eval(get(hObject, 'String'));
if isnan(b2)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
handles.data.b2 = b2;
guidata(hObject,handles)
% Hints: get(hObject,'String') returns contents of b2 as text
%        eval(get(hObject,'String')) returns contents of b2 as a double



function l2_Callback(hObject, eventdata, handles)
% hObject    handle to l2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
l2 = eval(get(hObject, 'String'));
if isnan(l2)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
handles.data.l2 = l2;
guidata(hObject,handles)
% Hints: get(hObject,'String') returns contents of l2 as text
%        eval(get(hObject,'String')) returns contents of l2 as a double



function r2_Callback(hObject, eventdata, handles)
% hObject    handle to r2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
r2 = eval(get(hObject, 'String'));
if isnan(r2)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
handles.data.r2 = r2;
guidata(hObject,handles)
% Hints: get(hObject,'String') returns contents of r2 as text
%        eval(get(hObject,'String')) returns contents of r2 as a double


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val=get(hObject,'Value');
if(val == 0)
   val = 1;
end
switch (val)
    case 1
        set(handles.tco1,'Visible','off');
        set(handles.co1,'Visible','on');
        set(handles.Ctext1,'Visible','off');
        set(handles.Ctext2,'Visible','off');
        set(handles.a1, 'Visible','off');
        set(handles.tb1,'Visible','off');
        set(handles.Ctext3,'String','δ(');
        set(handles.Ctext4,'String','t-');
        set(handles.Ctext5,'String',')');
        type1 = 1;
    case 2
        set(handles.tco1,'Visible','off');
        set(handles.Ctext1,'Visible','off');
        set(handles.Ctext2,'Visible','off');
        set(handles.tb1,'Visible','off');
        set(handles.a1, 'Visible', 'on' );
        set(handles.Ctext3,'String','u(');
        set(handles.Ctext4,'String','t-');
        set(handles.Ctext5,'String',')');
        type1 = 2;
    case 3
        set(handles.tco1,'Visible','off');
        set(handles.a1,'Visible','on');
        set(handles.Ctext1,'Visible','off');
        set(handles.Ctext2,'Visible','off');
        set(handles.tb1,'Visible','off');
        set(handles.Ctext3,'String','Sa(');
        set(handles.Ctext4,'String','t-');
        set(handles.Ctext5,'String',')');
        set(handles.co1,'Visible','off');
        type1 = 3;
    case 4
        
        set(handles.co1,'Visible','off');
        set(handles.Ctext1,'Visible','on');
         set(handles.Ctext2,'Visible','on');
        set(handles.Ctext2,'String',')-');
        set(handles.tb1,'Visible','on');
        set(handles.Ctext3,'String','u(');
        set(handles.Ctext4,'String','t-');
        set(handles.Ctext5,'String',')]');
        set(handles.a1,'Visible','off');
        set(handles.tco1,'Visible','off');
        type1 = 4;
    case 5
        set(handles.tco1,'Visible','off');
        set(handles.Ctext1,'Visible','off');
        set(handles.Ctext2,'Visible','off');
        set(handles.tb1,'Visible','off');
        set(handles.Ctext3,'String','exp[(');
        set(handles.Ctext4,'String','+');
        set(handles.Ctext5,'String','j)t]');
        set(handles.a1,'Visible','on');
        type1 = 5;
        
      
end
handles.data.type1 = type1;
guidata(hObject,handles)        

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val=get(hObject,'Value');
type2 = 1;
switch (val)
    case 1
        set(handles.Ctext6,'String','δ(');
        set(handles.a2,'Visible','off');
        set(handles.Ctext8,'String',')');
        set(handles.tb2,'Visible','off');
        set(handles.Ctext9,'Visible','off');
        set(handles.Ctext7,'String','t-');
        type2 = 1;
    case 2
        set(handles.Ctext6,'String','u(');
        set(handles.a2,'Visible','on');
        set(handles.Ctext8,'String',')');
        set(handles.Ctext7,'String','t-');
        set(handles.tb2,'Visible','off');
        set(handles.Ctext9,'Visible','off');
        type2 = 2;
    case 3
        set(handles.Ctext6,'String','Sa(');
        set(handles.a2,'Visible','on');
        set(handles.co2,'Visible','off');
        set(handles.Ctext8,'String',')');
        set(handles.tb2,'Visible','off');
        set(handles.Ctext7,'String','t-');
        set(handles.Ctext9,'Visible','off');
        type2 = 3;
    case 4
        set(handles.Ctext6,'String','[u(');
        set(handles.a2,'Visible','off');
        set(handles.Ctext7,'String','t-');
        set(handles.Ctext8,'String',')+u(t-');
        set(handles.tb2,'Visible','on');
        set(handles.co2,'Visible','on');
        set(handles.Ctext9,'Visible','on');
        type2 = 4;
     case 5
        set(handles.Ctext6,'String','exp[(');
        set(handles.a2,'Visible','on');
        set(handles.Ctext7,'String','+');
        set(handles.Ctext8,'String','j)t]');
        set(handles.tb2,'Visible','off');
        set(handles.Ctext9,'Visible','off');
        type2 = 5;
end
handles.data.type2 = type2;
guidata(hObject,handles)
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tb2_Callback(hObject, eventdata, handles)
% hObject    handle to tb2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tb2 = eval(get(hObject, 'String'));
if isnan(tb2)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
handles.data.tb2 = tb2;
guidata(hObject,handles)
% Hints: get(hObject,'String') returns contents of tb2 as text
%        eval(get(hObject,'String')) returns contents of tb2 as a double


% --- Executes during object creation, after setting all properties.
function tb2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tb2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function co1_Callback(hObject, eventdata, handles)
% hObject    handle to co1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
co1 = eval(get(hObject, 'String'));
if isnan(co1)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
handles.data.co1 = co1;
guidata(hObject,handles);
% Hints: get(hObject,'String') returns contents of co1 as text
%        eval(get(hObject,'String')) returns contents of co1 as a double



function b1_Callback(hObject, eventdata, handles)
% hObject    handle to b1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
b1 = eval(get(hObject, 'String'));
if isnan(b1)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
handles.data.b1 = b1;
guidata(hObject,handles);
% Hints: get(hObject,'String') returns contents of b1 as text
%        eval(get(hObject,'String')) returns contents of b1 as a double




% --- Executes during object creation, after setting all properties.
function co1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to co1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function b1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to b1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function Ctext1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ctext1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function signal1_Callback(hObject, eventdata, handles)
% hObject    handle to signal1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
sig1 = get(hObject, 'String');
if isempty(sig1)
    set(hObject, 'String', '');
    errordlg('Input must be a expression string','Error');
end
handles.data.sig1 = sig1;
guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of signal1 as text
%        eval(get(hObject,'String')) returns contents of signal1 as a double


% --- Executes during object creation, after setting all properties.
function signal1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to signal1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function signal2_Callback(hObject, eventdata, handles)
% hObject    handle to signal2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
sig2 = get(hObject, 'String');
if isempty(sig2)
    set(hObject, 'String', '');
    errordlg('Input must be a expression string','Error');
end
handles.data.sig2 = sig2;
guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of signal2 as text
%        eval(get(hObject,'String')) returns contents of signal2 as a double


% --- Executes during object creation, after setting all properties.
function signal2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to signal2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
t3 = handles.data.l3:0.01:handles.data.r3; %0.01是默认采样率
%然后使用subs指令将f3生成
syms t
f3 = subs(handles.data.sig1,t,t3);
%类似的生成y4
t4 = handles.data.l4:0.01:handles.data.r4;
f4 = subs(handles.data.sig2,t,t4);
%figure(1);
try
ct_conv_private(f3,f4,t3,t4);
catch 
    msgbox('Something wrong happended! Sorry!');
end



function l3_Callback(hObject, eventdata, handles)
% hObject    handle to l3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
l3 = eval(get(hObject, 'String'));
if isnan(l3)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
handles.data.l3 = l3;
guidata(hObject,handles);
% Hints: get(hObject,'String') returns contents of l3 as text
%        eval(get(hObject,'String')) returns contents of l3 as a double


% --- Executes during object creation, after setting all properties.
function l3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to l3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r3_Callback(hObject, eventdata, handles)
% hObject    handle to r3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
r3 = eval(get(hObject, 'String'));
if isnan(r3)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
handles.data.r3 = r3;
guidata(hObject,handles);
% Hints: get(hObject,'String') returns contents of r3 as text
%        eval(get(hObject,'String')) returns contents of r3 as a double


% --- Executes during object creation, after setting all properties.
function r3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function l4_Callback(hObject, eventdata, handles)
% hObject    handle to l4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
l4 = eval(get(hObject, 'String'));
if isnan(l4)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
handles.data.l4 = l4;
guidata(hObject,handles);
% Hints: get(hObject,'String') returns contents of l4 as text
%        eval(get(hObject,'String')) returns contents of l4 as a double


% --- Executes during object creation, after setting all properties.
function l4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to l4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r4_Callback(hObject, eventdata, handles)
% hObject    handle to r4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
r4 = eval(get(hObject, 'String'));
if isnan(r4)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
handles.data.r4 = r4;
guidata(hObject,handles);
% Hints: get(hObject,'String') returns contents of r4 as text
%        eval(get(hObject,'String')) returns contents of r4 as a double


% --- Executes during object creation, after setting all properties.
function r4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
