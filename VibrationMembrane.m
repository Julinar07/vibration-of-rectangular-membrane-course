%% Nama Program : Vibration of Rectangular Membrane
% Pembuat : Julinar (06111740000025)

function varargout = VibrationMembrane(varargin)
% VIBRATIONMEMBRANE MATLAB code for VibrationMembrane.fig
% Last Modified by GUIDE v2.5 24-Oct-2019 19:22:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @VibrationMembrane_OpeningFcn, ...
                   'gui_OutputFcn',  @VibrationMembrane_OutputFcn, ...
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


% --- Executes just before VibrationMembrane is made visible.
function VibrationMembrane_OpeningFcn(hObject, eventdata, handles, varargin)
movegui('center');

axes(handles.axes6);
image(imread('its.png'));
grid off;
axis off;

axes(handles.axes7);
image(imread('mat.png'));
grid off;
axis off;

axes(handles.axes10);
image(imread('gov.png'));
grid off;
axis off;

% Choose default command line output for VibrationMembrane
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes VibrationMembrane wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = VibrationMembrane_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;



function magnitude_Callback(hObject, eventdata, handles)
% hObject    handle to magnitude (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of magnitude as text
%        str2double(get(hObject,'String')) returns contents of magnitude as a double


% --- Executes during object creation, after setting all properties.
function magnitude_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in sketch.
function sketch_Callback(hObject, eventdata, handles)
% Cara menampilkan grafik
axes(handles.axes8)

a=str2double(get(handles.panjangx,'String'));
b=str2double(get(handles.panjangy,'String'));
m=str2double(get(handles.bentukm,'String'));
n=str2double(get(handles.bentukn,'String'));
A=str2double(get(handles.magnitude,'String'));

%x and y modes
x = linspace(0,a,100);
y = linspace(0,b,100);
[xx,yy] = meshgrid(x,y);
phix = sin(m*pi*xx/a);
phiy = sin(n*pi*yy/b);
%displacement / deflection
w = 1;

if a>=1 && b>=1 
    for t = 1:0.1:20
        cla;
        zz = A*phix.*phiy*sin(w*t);
        mesh(xx,yy,zz)
        xlabel('x-axis'),ylabel('y-axis');
        title('Plot The Solution');
        axis([0 a 0 b -A A])
        view(45,45)
        drawnow
    end
end
if a<0 && b<0
    msgbox('Panjang tidak mungkin bernilai negatif','Error','error');
    set(handles.panjangx,'String','');
    set(handles.panjangy,'String','');    
end
if a>=1 && b<0
    msgbox('Panjang tidak mungkin bernilai negatif','Error','error');
    set(handles.panjangx,'String','');
    set(handles.panjangy,'String','');    
end
if a<0 && b>=1
    msgbox('Panjang tidak mungkin bernilai negatif','Error','error');
    set(handles.panjangx,'String','');
    set(handles.panjangy,'String','');    
end
if a==0 || b==0
    msgbox('Tidak memungkinkan saat panjang bernilai nol','Error','error');
    set(handles.panjangx,'String','');
    set(handles.panjangy,'String','');
end

% --- Executes on button press in clear.
function clear_Callback(hObject, eventdata, handles)
cla(handles.axes8,'reset')
set(handles.magnitude,'String','');
set(handles.panjangx,'String','');
set(handles.panjangy,'String','');
set(handles.bentukm,'String','');
set(handles.bentukn,'String','');
guidata(hObject,handles);



function panjangx_Callback(hObject, eventdata, handles)
% hObject    handle to panjangx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of panjangx as text
%        str2double(get(hObject,'String')) returns contents of panjangx as a double


% --- Executes during object creation, after setting all properties.
function panjangx_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function panjangy_Callback(hObject, eventdata, handles)
% hObject    handle to panjangy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of panjangy as text
%        str2double(get(hObject,'String')) returns contents of panjangy as a double


% --- Executes during object creation, after setting all properties.
function panjangy_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bentukm_Callback(hObject, eventdata, handles)
% hObject    handle to bentukm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bentukm as text
%        str2double(get(hObject,'String')) returns contents of bentukm as a double


% --- Executes during object creation, after setting all properties.
function bentukm_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bentukn_Callback(hObject, eventdata, handles)
% hObject    handle to bentukn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bentukn as text
%        str2double(get(hObject,'String')) returns contents of bentukn as a double


% --- Executes during object creation, after setting all properties.
function bentukn_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on panjangx and none of its controls.
function panjangx_KeyPressFcn(hObject, eventdata, handles)
masukan=(eventdata.Character);
a=[112;105;8;13];
if masukan~=char(40:57,a)
    msgbox('INPUTAN HARUS BERUPA ANGKA','Error','error');
    set(handles.panjangx,'String','');
end

% --- Executes on key press with focus on panjangy and none of its controls.
function panjangy_KeyPressFcn(hObject, eventdata, handles)
masukan=(eventdata.Character);
a=[112;105;8;13];
if masukan~=char(40:57,a)
    msgbox('INPUTAN HARUS BERUPA ANGKA','Error','error');
    set(handles.panjangy,'String','')
end


% --- Executes on key press with focus on bentukm and none of its controls.
function bentukm_KeyPressFcn(hObject, eventdata, handles)
masukan=(eventdata.Character);
a=[112;105;8;13];
if masukan~=char(40:57,a)
    msgbox('INPUTAN HARUS BERUPA ANGKA','Error','error');
    set(handles.bentukm,'String','')
end


% --- Executes on key press with focus on bentukn and none of its controls.
function bentukn_KeyPressFcn(hObject, eventdata, handles)
masukan=(eventdata.Character);
a=[112;105;8;13];
if masukan~=char(40:57,a)
    msgbox('INPUTAN HARUS BERUPA ANGKA','Error','error');
    set(handles.bentukn,'String','')
end


% --- Executes on key press with focus on magnitude and none of its controls.
function magnitude_KeyPressFcn(hObject, eventdata, handles)
masukan=(eventdata.Character);
a=[112;105;8;13];
if masukan~=char(40:57,a)
    msgbox('INPUTAN HARUS BERUPA ANGKA','Error','error');
    set(handles.magnitude,'String','')
end
