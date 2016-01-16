function varargout = Project(varargin)
% PROJECT MATLAB code for Project.fig
%      PROJECT, by itself, creates a new PROJECT or raises the existing
%      singleton*.
%
%      H = PROJECT returns the handle to a new PROJECT or the handle to
%      the existing singleton*.
%
%      PROJECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECT.M with the given input arguments.
%
%      PROJECT('Property','Value',...) creates a new PROJECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Project_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Project_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Project

% Last Modified by GUIDE v2.5 04-Jul-2015 21:15:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Project_OpeningFcn, ...
                   'gui_OutputFcn',  @Project_OutputFcn, ...
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


% --- Executes just before Project is made visible.
function Project_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Project (see VARARGIN)

% Choose default command line output for Project
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Project wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Project_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function CDS_Callback(hObject, eventdata, handles)
% hObject    handle to CDS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function CDS_CT_Callback(hObject, eventdata, handles)
% hObject    handle to CDS_CT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function CDS_CT_imp_Callback(hObject, eventdata, handles)
% hObject    handle to CDS_CT_imp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 CDS_CT_imp

% --------------------------------------------------------------------
function CDS_CT_stp_Callback(hObject, eventdata, handles)
% hObject    handle to CDS_CT_stp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CDS_CT_stp

% --------------------------------------------------------------------
function CDS_CT_Rec_Callback(hObject, eventdata, handles)
% hObject    handle to CDS_CT_Rec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CDS_CT_Rec

% --------------------------------------------------------------------
function CDS_CT_Sa_Callback(hObject, eventdata, handles)
% hObject    handle to CDS_CT_Sa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 CDS_CT_Sa

% --------------------------------------------------------------------
function CDS_CT_exp_Callback(hObject, eventdata, handles)
% hObject    handle to CDS_CT_exp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CDS_CT_exp

% --------------------------------------------------------------------
function CDS_CT_sym_Callback(hObject, eventdata, handles)
% hObject    handle to CDS_CT_sym (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CDS_CT_sym

% --------------------------------------------------------------------
function CDS_DT_Callback(hObject, eventdata, handles)
% hObject    handle to CDS_DT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function CDS_DT_imp_Callback(hObject, eventdata, handles)
% hObject    handle to CDS_DT_imp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CDS_DT_imp

% --------------------------------------------------------------------
function CDS_DT_stp_Callback(hObject, eventdata, handles)
% hObject    handle to CDS_DT_stp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CDS_DT_stp

% --------------------------------------------------------------------
function CDS_DT_Rec_Callback(hObject, eventdata, handles)
% hObject    handle to CDS_DT_Rec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CDS_DT_Rec

% --------------------------------------------------------------------
function CDS_DT_Sa_Callback(hObject, eventdata, handles)
% hObject    handle to CDS_DT_Sa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CDS_DT_Sa

% --------------------------------------------------------------------
function CDS_DT_exp_Callback(hObject, eventdata, handles)
% hObject    handle to CDS_DT_exp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CDS_DT_exp

% --------------------------------------------------------------------
function CDS_DT_sym_Callback(hObject, eventdata, handles)
% hObject    handle to CDS_DT_sym (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CDS_DT_sym

%%---------------------------------------------------------------------------------------------%%
%%---------------------------------------------------------------------------------------------%%


% --------------------------------------------------------------------
function Convol_Callback(hObject, eventdata, handles)
% hObject    handle to Convol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Convol_CT_Callback(hObject, eventdata, handles)
% hObject    handle to Convol_CT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --------------------------------------------------------------------
CT_conv

% --------------------------------------------------------------------
function Convol_DT_Callback(hObject, eventdata, handles)
% hObject    handle to Convol_DT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
DT_Convoltion

%%---------------------------------------------------------------------------------------------%%
%%---------------------------------------------------------------------------------------------%%


% --------------------------------------------------------------------
function FourS_Callback(hObject, eventdata, handles)
% hObject    handle to FourS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
FourS


%%---------------------------------------------------------------------------------------------%%
%%---------------------------------------------------------------------------------------------%%



function FourT_Callback(hObject, eventdata, handles)
% hObject    handle to FourT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%%---------------------------------------------------------------------------------%%
% --------------------------------------------------------------------
function FourT_CTFT_Callback(hObject, eventdata, handles)
% hObject    handle to FourT_CTFT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function FourT_CTFT_imp_Callback(hObject, eventdata, handles)
% hObject    handle to FourT_CTFT_imp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
FourT_CTFT_imp

% --------------------------------------------------------------------
function FourT_CTFT_stp_Callback(hObject, eventdata, handles)
% hObject    handle to FourT_CTFT_stp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
FourT_CTFT_stp

% --------------------------------------------------------------------
function FourT_CTFT_Rec_Callback(hObject, eventdata, handles)
% hObject    handle to FourT_CTFT_Rec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
FourT_CTFT_Rec

% --------------------------------------------------------------------
function FourT_CTFT_Sa_Callback(hObject, eventdata, handles)
% hObject    handle to FourT_CTFT_Sa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
FourT_CTFT_Sa

% --------------------------------------------------------------------
function FourT_CTFT_exp_Callback(hObject, eventdata, handles)
% hObject    handle to FourT_CTFT_exp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
FourT_CTFT_exp

% --------------------------------------------------------------------
function FourT_CTFT_sym_Callback(hObject, eventdata, handles)
% hObject    handle to FourT_CTFT_sym (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
FourT_CTFT_Sym

%%--------------------------------------------------------------------------------%%
% --------------------------------------------------------------------
function FourT_CTIFT_Callback(hObject, eventdata, handles)
% hObject    handle to FourT_CTIFT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function FourT_CTIFT_imp_Callback(hObject, eventdata, handles)
% hObject    handle to FourT_CTIFT_imp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
FourT_CTIFT_imp

% --------------------------------------------------------------------
function FourT_CTIFT_stp_Callback(hObject, eventdata, handles)
% hObject    handle to FourT_CTIFT_stp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
FourT_CTIFT_stp

% --------------------------------------------------------------------
function FourT_CTIFT_Rec_Callback(hObject, eventdata, handles)
% hObject    handle to FourT_CTIFT_Rec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
FourT_CTIFT_Rec

% --------------------------------------------------------------------
function FourT_CTIFT_Sa_Callback(hObject, eventdata, handles)
% hObject    handle to FourT_CTIFT_Sa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
FourT_CTIFT_Sa

% --------------------------------------------------------------------
function FourT_CTIFT_exp_Callback(hObject, eventdata, handles)
% hObject    handle to FourT_CTIFT_exp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
FourT_CTIFT_exp

% --------------------------------------------------------------------
function FourT_CTIFT_sym_Callback(hObject, eventdata, handles)
% hObject    handle to FourT_CTIFT_sym (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
FourT_CTIFT_Sym

%%---------------------------------------------------------------------------------------%%
% --------------------------------------------------------------------
function FourT_DTFT_Callback(hObject, eventdata, handles)
% hObject    handle to FourT_DTFT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function FourT_DTFT_imp_Callback(hObject, eventdata, handles)
% hObject    handle to FourT_DTFT_imp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
FourT_DTFT_imp

% --------------------------------------------------------------------
function FourT_DTFT_stp_Callback(hObject, eventdata, handles)
% hObject    handle to FourT_DTFT_stp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
FourT_DTFT_stp

% --------------------------------------------------------------------
function FourT_DTFT_Rec_Callback(hObject, eventdata, handles)
% hObject    handle to FourT_DTFT_Rec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
FourT_DTFT_Rec

% --------------------------------------------------------------------
function FourT_DTFT_Sa_Callback(hObject, eventdata, handles)
% hObject    handle to FourT_DTFT_Sa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
FourT_DTFT_Sa

% --------------------------------------------------------------------
function FourT_DTFT_exp_Callback(hObject, eventdata, handles)
% hObject    handle to FourT_DTFT_exp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
FourT_DTFT_exp

% --------------------------------------------------------------------
function FourT_DTFT_sym_Callback(hObject, eventdata, handles)
% hObject    handle to FourT_DTFT_sym (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
FourT_DTFT_Sym

%%-------------------------------------------------------------------------------------%%
% --------------------------------------------------------------------
function FourT_DTIFT_Callback(hObject, eventdata, handles)
% hObject    handle to FourT_DTIFT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function FourT_DTIFT_imp_Callback(hObject, eventdata, handles)
% hObject    handle to FourT_DTIFT_imp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
FourT_DTIFT_imp

% --------------------------------------------------------------------
function FourT_DTIFT_stp_Callback(hObject, eventdata, handles)
% hObject    handle to FourT_DTIFT_stp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
FourT_DTIFT_stp

% --------------------------------------------------------------------
function FourT_DTIFT_Rec_Callback(hObject, eventdata, handles)
% hObject    handle to FourT_DTIFT_Rec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
FourT_DTIFT_Rec

% --------------------------------------------------------------------
function FourT_DTIFT_Sa_Callback(hObject, eventdata, handles)
% hObject    handle to FourT_DTIFT_Sa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
FourT_DTIFT_Sa

% --------------------------------------------------------------------
function FourT_DTIFT_exp_Callback(hObject, eventdata, handles)
% hObject    handle to FourT_DTIFT_exp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
FourT_DTIFT_exp

% --------------------------------------------------------------------
function FourT_DTIFT_sym_Callback(hObject, eventdata, handles)
% hObject    handle to FourT_DTIFT_sym (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
FourT_DTIFT_Sym

%%---------------------------------------------------------------------------------------------%%
%%---------------------------------------------------------------------------------------------%%




%%---------------------------------------------------------------------------------------------%%
%%---------------------------------------------------------------------------------------------%%
% --------------------------------------------------------------------
function Sampl_Callback(hObject, eventdata, handles)
% hObject    handle to Sampl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Sampl_CT_Callback(hObject, eventdata, handles)
% hObject    handle to Sampl_CT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Sampl_CT_imp_Callback(hObject, eventdata, handles)
% hObject    handle to Sampl_CT_imp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Sampl_CT_imp


% --------------------------------------------------------------------
function Sampl_CT_stp_Callback(hObject, eventdata, handles)
% hObject    handle to Sampl_CT_stp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Sampl_CT_stp


% --------------------------------------------------------------------
function Sampl_CT_Rec_Callback(hObject, eventdata, handles)
% hObject    handle to Sampl_CT_Rec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Sampl_CT_Rec


% --------------------------------------------------------------------
function Sampl_CT_Sa_Callback(hObject, eventdata, handles)
% hObject    handle to Sampl_CT_Sa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Sampl_CT_Sa


% --------------------------------------------------------------------
function Sampl_CT_exp_Callback(hObject, eventdata, handles)
% hObject    handle to Sampl_CT_exp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Sampl_CT_exp


% --------------------------------------------------------------------
function Sampl_CT_sym_Callback(hObject, eventdata, handles)
% hObject    handle to Sampl_CT_sym (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Sampl_CT_sym


%%-------------------------------------------------------------------------------------%%
% --------------------------------------------------------------------
function Sampl_DT_Callback(hObject, eventdata, handles)
% hObject    handle to Sampl_DT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Sampl_DT_imp_Callback(hObject, eventdata, handles)
% hObject    handle to Sampl_DT_imp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Sampl_DT_stp_Callback(hObject, eventdata, handles)
% hObject    handle to Sampl_DT_stp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Sampl_DT_Rec_Callback(hObject, eventdata, handles)
% hObject    handle to Sampl_DT_Rec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Sampl_DT_sa_Callback(hObject, eventdata, handles)
% hObject    handle to Sampl_DT_sa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Sampl_DT_exp_Callback(hObject, eventdata, handles)
% hObject    handle to Sampl_DT_exp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Sampl_DT_sym_Callback(hObject, eventdata, handles)
% hObject    handle to Sampl_DT_sym (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%%---------------------------------------------------------------------------------------------%%
%%---------------------------------------------------------------------------------------------%%



% --------------------------------------------------------------------
function LnZ_Callback(hObject, eventdata, handles)
% hObject    handle to LnZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function LnZ_Lap_Callback(hObject, eventdata, handles)
% hObject    handle to LnZ_Lap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
LnZ_Lap

% --------------------------------------------------------------------
function LnZ_Z_Callback(hObject, eventdata, handles)
% hObject    handle to LnZ_Z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
LnZ_Z

% --------------------------------------------------------------------
function ABOUT_1_Callback(hObject, eventdata, handles)
% hObject    handle to ABOUT_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ABOUT_1
