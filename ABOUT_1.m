function varargout = ABOUT_1(varargin)
% ABOUT_1 MATLAB code for ABOUT_1.fig
%      ABOUT_1, by itself, creates a new ABOUT_1 or raises the existing
%      singleton*.
%
%      H = ABOUT_1 returns the handle to a new ABOUT_1 or the handle to
%      the existing singleton*.
%
%      ABOUT_1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ABOUT_1.M with the given input arguments.
%
%      ABOUT_1('Property','Value',...) creates a new ABOUT_1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ABOUT_1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ABOUT_1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ABOUT_1

% Last Modified by GUIDE v2.5 02-Jul-2015 19:25:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ABOUT_1_OpeningFcn, ...
                   'gui_OutputFcn',  @ABOUT_1_OutputFcn, ...
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


% --- Executes just before ABOUT_1 is made visible.
function ABOUT_1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ABOUT_1 (see VARARGIN)

% Choose default command line output for ABOUT_1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ABOUT_1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ABOUT_1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
