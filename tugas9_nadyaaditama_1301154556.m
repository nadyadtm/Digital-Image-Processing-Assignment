function varargout = tugas9_nadyaaditama_1301154556(varargin)
% TUGAS9_NADYAADITAMA_1301154556 MATLAB code for tugas9_nadyaaditama_1301154556.fig
%      TUGAS9_NADYAADITAMA_1301154556, by itself, creates a new TUGAS9_NADYAADITAMA_1301154556 or raises the existing
%      singleton*.
%
%      H = TUGAS9_NADYAADITAMA_1301154556 returns the handle to a new TUGAS9_NADYAADITAMA_1301154556 or the handle to
%      the existing singleton*.
%
%      TUGAS9_NADYAADITAMA_1301154556('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TUGAS9_NADYAADITAMA_1301154556.M with the given input arguments.
%
%      TUGAS9_NADYAADITAMA_1301154556('Property','Value',...) creates a new TUGAS9_NADYAADITAMA_1301154556 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before tugas9_nadyaaditama_1301154556_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to tugas9_nadyaaditama_1301154556_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help tugas9_nadyaaditama_1301154556

% Last Modified by GUIDE v2.5 26-Apr-2018 07:31:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @tugas9_nadyaaditama_1301154556_OpeningFcn, ...
                   'gui_OutputFcn',  @tugas9_nadyaaditama_1301154556_OutputFcn, ...
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


% --- Executes just before tugas9_nadyaaditama_1301154556 is made visible.
function tugas9_nadyaaditama_1301154556_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to tugas9_nadyaaditama_1301154556 (see VARARGIN)

% Choose default command line output for tugas9_nadyaaditama_1301154556
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes tugas9_nadyaaditama_1301154556 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = tugas9_nadyaaditama_1301154556_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in browse.
function browse_Callback(hObject, eventdata, handles)
% hObject    handle to browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName] = uigetfile('*.jpg','Select the MATLAB code file');
handles.image = imread([PathName,FileName]);
guidata(hObject, handles);
axes(handles.gambar);
imshow(handles.image);


% --- Executes on button press in grayscale.
function grayscale_Callback(hObject, eventdata, handles)
% hObject    handle to grayscale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
R=handles.image(:,:,1);
G=handles.image(:,:,2);
B=handles.image(:,:,3);
Abu2 = (0.3*R + 0.6*G + 0.1*B);
figure;
imshow(Abu2);


% --- Executes on button press in zoomin.
function zoomin_Callback(hObject, eventdata, handles)
% hObject    handle to zoomin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[tinggi,lebar,panjang] = size(handles.image);
tinggi_baru = tinggi*2;
lebar_baru = lebar*2;
image_baru=uint8(zeros(tinggi_baru,lebar_baru,panjang));
for i=1 : tinggi
    for j=1 : lebar
        temp1=handles.image(i,j,1);
        temp2=handles.image(i,j,2);
        temp3=handles.image(i,j,3);
        for k=1:2
            for l=1:2
                dummyb=((i-1)*2 + k);
                dummyk=((j-1)*2 + l);
                image_baru(dummyb,dummyk,1)=temp1;
                image_baru(dummyb,dummyk,2)=temp2;
                image_baru(dummyb,dummyk,3)=temp3;
            end
        end
    end
end
figure;
imshow(image_baru);

% --- Executes on button press in zoomout.
function zoomout_Callback(hObject, eventdata, handles)
% hObject    handle to zoomout (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[tinggi,lebar,panjang] = size(handles.image);
tinggi_baru = floor(tinggi/2);
lebar_baru = floor(lebar/2);
image_baru=uint8(zeros(tinggi_baru,lebar_baru,panjang));
i = 1; j=1;
for k=1 :2: tinggi
    for l=1 :2: lebar
        image_baru(i,j,:)=handles.image(k,l,:);
        j=j+1;
    end
    i=i+1;
    j=1;
end
figure;
imshow(image_baru);


% --- Executes on button press in inverse.
function inverse_Callback(hObject, eventdata, handles)
% hObject    handle to inverse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
inverse = 255-handles.image;
figure;
imshow(inverse);


% --- Executes on button press in fHori.
function fHori_Callback(hObject, eventdata, handles)
% hObject    handle to fHori (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[tinggi, lebar, panjang]=size(handles.image);
image_baru=uint8(zeros(tinggi,lebar,panjang));
for i = tinggi : -1 : 1
    for j=lebar : -1 : 1
        image_baru(tinggi-i+1,lebar-j+1,:)=handles.image(i,lebar-j+1,:);
    end
end
figure
imshow(image_baru);

% --- Executes on button press in fVert.
function fVert_Callback(hObject, eventdata, handles)
% hObject    handle to fVert (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[tinggi, lebar, panjang]=size(handles.image);
image_baru=uint8(zeros(tinggi,lebar,panjang));
for i = tinggi : -1 : 1
    for j=lebar : -1 : 1
        image_baru(tinggi-i+1,lebar-j+1,:)=handles.image(tinggi-i+1,j,:);
    end
end
figure
imshow(image_baru);

% --- Executes on button press in crop.
function crop_Callback(hObject, eventdata, handles)
% hObject    handle to crop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[tinggi, lebar, panjang]=size(handles.image);
tinggi_baru = floor(tinggi*(0.5));
lebar_baru = floor(lebar*(0.5));
image_baru=uint8(zeros(tinggi_baru,lebar_baru,panjang));
for i = 1 : tinggi_baru
    for j = 1 : lebar_baru
        image_baru(i,j,:)=handles.image(i,j,:);
    end
end
figure;
imshow(image_baru);


% --- Executes on button press in pkurang.
function pkurang_Callback(hObject, eventdata, handles)
% hObject    handle to pkurang (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
angka = str2double(get(handles.pglp,'String'));
p = handles.image;
p = p-angka;
figure
imshow(p);


% --- Executes on button press in pbagi.
function pbagi_Callback(hObject, eventdata, handles)
% hObject    handle to pbagi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
angka = str2double(get(handles.pglp,'String'));
p = handles.image;
p = p/angka;
figure
imshow(p);

% --- Executes on button press in ptambah.
function ptambah_Callback(hObject, eventdata, handles)
% hObject    handle to ptambah (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
angka = str2double(get(handles.pnrg,'String'));
p = handles.image;
p = p+angka;
figure
imshow(p);

% --- Executes on button press in pkali.
function pkali_Callback(hObject, eventdata, handles)
% hObject    handle to pkali (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
angka = str2double(get(handles.pnrg,'String'));
p = handles.image;
p = p*angka;
figure
imshow(p);



function pglp_Callback(hObject, eventdata, handles)
% hObject    handle to pglp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pglp as text
%        str2double(get(hObject,'String')) returns contents of pglp as a double


% --- Executes during object creation, after setting all properties.
function pglp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pglp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pnrg_Callback(hObject, eventdata, handles)
% hObject    handle to pnrg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pnrg as text
%        str2double(get(hObject,'String')) returns contents of pnrg as a double


% --- Executes during object creation, after setting all properties.
function pnrg_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pnrg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in histogram.
function histogram_Callback(hObject, eventdata, handles)
% hObject    handle to histogram (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x = handles.image;
list_histogramR = zeros(256,1);
list_histogramG = zeros(256,1);
list_histogramB = zeros(256,1);
[tinggi, lebar, panjang]=size(x);
for j=1 : tinggi
    for k=1 : lebar
        list_histogramR(x(j,k,1)+1)=list_histogramR(x(j,k,1)+1)+1;
        list_histogramG(x(j,k,2)+1)=list_histogramG(x(j,k,2)+1)+1;
        list_histogramB(x(j,k,3)+1)=list_histogramB(x(j,k,3)+1)+1;
    end
end

Horis = (0:255)';
figure;
title('Histogram R');
bar(Horis,list_histogramR);
figure;
title('Histogram G');
bar(Horis,list_histogramG);
figure;
title('Histogram B');
bar(Horis,list_histogramB);


% --- Executes on button press in rotate90.
function rotate90_Callback(hObject, eventdata, handles)
% hObject    handle to rotate90 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%coba-coba rotasi
x=handles.image;
[baris,kolom,panjang]=size(x);
for i=1 : baris
    for j=1 : kolom
        d(i,j,:)=x(i,j,:);
    end
end

for i=1 : baris
    for j=1 : kolom
        out(j,baris+1-i,:)=d(i,j,:);
    end
end
figure
imshow(out);

% --- Executes on button press in rotate180.
function rotate180_Callback(hObject, eventdata, handles)
% hObject    handle to rotate180 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%coba-coba rotasi
x=handles.image;
[baris,kolom,panjang]=size(x);
for i=1 : baris
    for j=1 : kolom
        d(i,j,:)=x(i,j,:);
    end
end

for i=1 : baris
    for j=1 : kolom
        out(baris+1-i,kolom+1-j,:)=d(i,j,:);
    end
end
figure
imshow(out);


% --- Executes on button press in rotate270.
function rotate270_Callback(hObject, eventdata, handles)
% hObject    handle to rotate270 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%coba-coba rotasi
x=handles.image;
[baris,kolom,panjang]=size(x);
for i=1 : baris
    for j=1 : kolom
        d(i,j,:)=x(i,j,:);
    end
end

for i=1 : baris
    for j=1 : kolom
        out(kolom+1-j,i,:)=d(i,j,:);
    end
end
figure
imshow(out);


% --- Executes on button press in edge.
function edge_Callback(hObject, eventdata, handles)
% hObject    handle to edge (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x = handles.image;%Name of image file
[tinggi, lebar, panjang]=size(x);
image_baru=double(x);
y = [1 1 1
    1 -8 1
    1 1 1];
for i=2 : tinggi-2
    for j=2 : lebar-2
        jum=image_baru(i-1,j-1)*y(1,1)+image_baru(i,j-1)*y(2,1)...
            + image_baru(i+1,j-1)*y(3,1)+image_baru(i-1,j)*y(1,2)...
            + image_baru(i,j)*y(2,2)+image_baru(i+1,j)*y(3,2)...
            +image_baru(i-1,j+1)*y(1,3)+image_baru(i,j+1)*y(2,3)...
            +image_baru(i+1,j+1)*y(3,3);
        img(i-1,j-1)=jum;
    end
end
figure
imshow(uint8(img));

% --- Executes on button press in blur.
function blur_Callback(hObject, eventdata, handles)
% hObject    handle to blur (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x = handles.image;%Name of image file
[tinggi, lebar, panjang]=size(x);
image_baru=double(x);
y = [1/9 1/9 1/9
    1/9 1/9 1/9
    1/9 1/9 1/9];
for i=2 : tinggi-2
    for j=2 : lebar-2
        jum=image_baru(i-1,j-1,:)*y(1,1,:)+image_baru(i,j-1,:)*y(2,1,:)...
            + image_baru(i+1,j-1,:)*y(3,1,:)+image_baru(i-1,j,:)*y(1,2,:)...
            + image_baru(i,j,:)*y(2,2,:)+image_baru(i+1,j,:)*y(3,2,:)...
            +image_baru(i-1,j+1,:)*y(1,3,:)+image_baru(i,j+1,:)*y(2,3,:)...
            +image_baru(i+1,j+1,:)*y(3,3,:);
        img(i-1,j-1,:)=jum;
    end
end
figure
imshow(uint8(img));


% --- Executes on button press in sharp.
function sharp_Callback(hObject, eventdata, handles)
% hObject    handle to sharp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x = handles.image;%Name of image file
[tinggi, lebar, panjang]=size(x);
image_baru=double(x);
y = [0 -1 0
    -1 5 -1
    0 -1 0];
for i=2 : tinggi-2
    for j=2 : lebar-2
        jum=image_baru(i-1,j-1,:)*y(1,1,:)+image_baru(i,j-1,:)*y(2,1,:)...
            + image_baru(i+1,j-1,:)*y(3,1,:)+image_baru(i-1,j,:)*y(1,2,:)...
            + image_baru(i,j,:)*y(2,2,:)+image_baru(i+1,j,:)*y(3,2,:)...
            +image_baru(i-1,j+1,:)*y(1,3,:)+image_baru(i,j+1,:)*y(2,3,:)...
            +image_baru(i+1,j+1,:)*y(3,3,:);
        img(i-1,j-1,:)=jum;
    end
end
figure
imshow(uint8(img));


% --- Executes on button press in mean.
function mean_Callback(hObject, eventdata, handles)
% hObject    handle to mean (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x = handles.image;%Name of image file
[tinggi, lebar, panjang]=size(x);
image_baru=double(x);
for i=2 : tinggi-2
    for j=2 : lebar-2
        jum=image_baru(i-1,j-1,:)+image_baru(i,j-1,:)...
            + image_baru(i+1,j-1,:)+image_baru(i-1,j,:)...
            + image_baru(i,j,:)+image_baru(i+1,j,:)...
            +image_baru(i-1,j+1,:)+image_baru(i,j+1,:)...
            +image_baru(i+1,j+1,:);
        img(i-1,j-1,:)=floor(jum/9);
    end
end
figure
imshow(uint8(img));

% --- Executes on button press in median.
function median_Callback(hObject, eventdata, handles)
% hObject    handle to median (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x = handles.image;%Name of image file
[tinggi, lebar, panjang]=size(x);
image_baru=double(x);
for i=2 : tinggi-2
    for j=2 : lebar-2
%         temp = image_baru(i-1:i+1,j-1:j+1,:);
        for k=1 : 3
            temp(1) = image_baru(i-1,j-1,k);
            temp(2) = image_baru(i,j-1,k);
            temp(3) = image_baru(i+1,j-1,k);
            temp(4) = image_baru(i-1,j,k);
            temp(5) = image_baru(i,j,k);
            temp(6) = image_baru(i+1,j,k);
            temp(7) = image_baru(i-1,j+1,k);
            temp(8) = image_baru(i,j+1,k);
            temp(9) = image_baru(i+1,j+1,k);
            y = sort(temp);
            img(i-1,j-1,k)=y(5);
        end
    end
end
figure
imshow(uint8(img));

% --- Executes on button press in modus.
function modus_Callback(hObject, eventdata, handles)
% hObject    handle to modus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x = handles.image;
[tinggi, lebar, panjang]=size(x);
image_baru=double(x);
for i=2 : tinggi-2
    for j=2 : lebar-2
%         temp = image_baru(i-1:i+1,j-1:j+1,:);
        for k=1 : 3
            temp(1) = image_baru(i-1,j-1,k);
            temp(2) = image_baru(i,j-1,k);
            temp(3) = image_baru(i+1,j-1,k);
            temp(4) = image_baru(i-1,j,k);
            temp(5) = image_baru(i,j,k);
            temp(6) = image_baru(i+1,j,k);
            temp(7) = image_baru(i-1,j+1,k);
            temp(8) = image_baru(i,j+1,k);
            temp(9) = image_baru(i+1,j+1,k);
            img(i-1,j-1,k)=mode(temp);
        end
    end
end
figure
imshow(uint8(img));


% --- Executes on button press in reggrowth.
function reggrowth_Callback(hObject, eventdata, handles)
% hObject    handle to reggrowth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x = str2double(get(handles.sumbux,'String'));
y = str2double(get(handles.sumbuy,'String'));

threshold = 30;
z = handles.image;
z = rgb2gray(z);

a = 100;

[tinggi, lebar]=size(z);
reg = zeros(tinggi,lebar);
visitor = zeros(tinggi,lebar);
seed=z(x,y);

while visitor ~= 1
    for i = 1 : tinggi
        for j = 1 : lebar
            if z(i,j)<threshold+seed && visitor(i,j)~=1
                reg(i,j)=a;
                visitor(i,j)=1;
            end
        end
    end
    a = a + 100;
    for i = 1 : tinggi
        for j = 1 : lebar
            if visitor(i,j)~=1
                seed = z(i,j);
                break;
            end
        end
    end
end

figure
imshow(uint8(reg));


function sumbux_Callback(hObject, eventdata, handles)
% hObject    handle to sumbux (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sumbux as text
%        str2double(get(hObject,'String')) returns contents of sumbux as a double


% --- Executes during object creation, after setting all properties.
function sumbux_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sumbux (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sumbuy_Callback(hObject, eventdata, handles)
% hObject    handle to sumbuy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sumbuy as text
%        str2double(get(hObject,'String')) returns contents of sumbuy as a double


% --- Executes during object creation, after setting all properties.
function sumbuy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sumbuy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nilaiRatas_Callback(hObject, eventdata, handles)
% hObject    handle to nilaiRatas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nilaiRatas as text
%        str2double(get(hObject,'String')) returns contents of nilaiRatas as a double


% --- Executes during object creation, after setting all properties.
function nilaiRatas_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nilaiRatas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nilaiRbawah_Callback(hObject, eventdata, handles)
% hObject    handle to nilaiRbawah (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nilaiRbawah as text
%        str2double(get(hObject,'String')) returns contents of nilaiRbawah as a double


% --- Executes during object creation, after setting all properties.
function nilaiRbawah_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nilaiRbawah (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nilaiGatas_Callback(hObject, eventdata, handles)
% hObject    handle to nilaiGatas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nilaiGatas as text
%        str2double(get(hObject,'String')) returns contents of nilaiGatas as a double


% --- Executes during object creation, after setting all properties.
function nilaiGatas_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nilaiGatas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nilaiGbawah_Callback(hObject, eventdata, handles)
% hObject    handle to nilaiGbawah (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nilaiGbawah as text
%        str2double(get(hObject,'String')) returns contents of nilaiGbawah as a double


% --- Executes during object creation, after setting all properties.
function nilaiGbawah_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nilaiGbawah (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nilaiBatas_Callback(hObject, eventdata, handles)
% hObject    handle to nilaiBatas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nilaiBatas as text
%        str2double(get(hObject,'String')) returns contents of nilaiBatas as a double


% --- Executes during object creation, after setting all properties.
function nilaiBatas_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nilaiBatas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nilaiBbawah_Callback(hObject, eventdata, handles)
% hObject    handle to nilaiBbawah (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nilaiBbawah as text
%        str2double(get(hObject,'String')) returns contents of nilaiBbawah as a double


% --- Executes during object creation, after setting all properties.
function nilaiBbawah_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nilaiBbawah (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ThresholdRGB.
function ThresholdRGB_Callback(hObject, eventdata, handles)
% hObject    handle to ThresholdRGB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Ratas = str2double(get(handles.nilaiRatas,'String'));
Rbawah = str2double(get(handles.nilaiRbawah,'String'));
Gatas = str2double(get(handles.nilaiGatas,'String'));
Gbawah = str2double(get(handles.nilaiGbawah,'String'));
Batas = str2double(get(handles.nilaiBatas,'String'));
Bbawah = str2double(get(handles.nilaiBbawah,'String'));
x = handles.image;%Name of image file
[tinggi, lebar, panjang]=size(x);
image_baru=zeros(tinggi,lebar,panjang);
for i=1 : tinggi
    for j=1 : lebar
        if x(i,j,1)>Ratas && x(i,j,1)<Rbawah && x(i,j,2)>Gatas && x(i,j,2)<Gbawah && x(i,j,3)>Batas && x(i,j,3)<Bbawah
            image_baru(i,j,:)=x(i,j,:);
        end
    end
end
figure
imshow(uint8(image_baru));


% --- Executes on button press in dilasi.
function dilasi_Callback(hObject, eventdata, handles)
% hObject    handle to dilasi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x = handles.image;
x = im2bw(x);
image_baru = imcomplement(x);
[tinggi, lebar]=size(image_baru);
image_fix = image_baru;

for i=2 : tinggi-2
    for j=2 : lebar-2
        if image_baru(i,j)==1
            image_fix(i,j-1) = 1;
            image_fix(i,j)   = 1;
            image_fix(i,j+1) = 1;
            image_fix(i-1,j) = 1;
            image_fix(i+1,j) = 1;
        end
    end
end
figure
subplot(1,2,1), subimage(image_baru);
subplot(1,2,2), subimage(image_fix);


% --- Executes on button press in Erosi.
function Erosi_Callback(hObject, eventdata, handles)
% hObject    handle to Erosi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

x = handles.image;
x = im2bw(x);
image_baru = imcomplement(x);
[tinggi, lebar]=size(image_baru);
image_fix = double(image_baru);

for i=2 : tinggi-2
    for j=2 : lebar-2
        if image_baru(i,j)==1
            if image_fix(i,j-1)==0 || image_fix(i,j+1)==0 || image_fix(i-1,j)==0 || image_fix(i+1,j)==0
                image_fix(i,j)=2;
            end
        end
    end
end

image_fix_banget = zeros(tinggi,lebar);

for i=1 : tinggi
    for j=1 : lebar
        if image_fix(i,j)==1
            image_fix_banget(i,j)=1;
        end
    end
end

figure;
subplot(1,2,1), subimage(image_baru);
subplot(1,2,2), subimage(image_fix_banget);
