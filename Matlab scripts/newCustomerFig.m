% NEWCUSTOMERFIG MATLAB code for newCustomerFig.fig
function varargout = newCustomerFig(varargin)
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @newCustomerFig_OpeningFcn, ...
                   'gui_OutputFcn',  @newCustomerFig_OutputFcn, ...
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


% --- Executes just before newCustomerFig is made visible.
function newCustomerFig_OpeningFcn(hObject, eventdata, handles, varargin)
% Choose default command line output for newCustomerFig
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);


% --- Outputs from this function are returned to the command line.
function varargout = newCustomerFig_OutputFcn(hObject, eventdata, handles) 
% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit5_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit7_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
MeterMobNum = get(handles.edit1,'String');
MeterMobNum=str2num(MeterMobNum);
BillingMob = get(handles.edit7,'String');
BillingMob=str2num(BillingMob);
cusName = get(handles.edit5,'String');
cusAddr = get(handles.edit6,'String');
curData = get(handles.edit3,'String');
curData=str2num(curData);
conn = database('nikkDb', 'sa', 'nikk', 'Vendor', 'MICROSOFT SQL SERVER', 'Server', '127.0.0.1', 'PortNumber', 1433, 'AuthType', 'Server');
a = isconnection(conn);
colnames={'MeterMobNum','BillingMobNum','CustomerName','CustomerAddr','PrevReading','CurReading','Units','BillAmount'};
exdata={MeterMobNum,BillingMob,cusName,cusAddr,0,curData,0,0};
set(conn,'AutoCommit','off');
% Inserts new record to the energyDatabase table
datainsert(conn,'energyDatabase',colnames,exdata);
commit(conn);
close(conn);
close newCustomerFig;


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
close newCustomerFig;
