% MODIFY_CUSTOMER_DETAILS MATLAB code for Modify_Customer_Details.fig
function varargout = Modify_Customer_Details(varargin)
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Modify_Customer_Details_OpeningFcn, ...
                   'gui_OutputFcn',  @Modify_Customer_Details_OutputFcn, ...
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
global unitPrice;
unitPrice=4;

% --- Executes just before Modify_Customer_Details is made visible.
function Modify_Customer_Details_OpeningFcn(hObject, eventdata, handles, varargin)
% Choose default command line output for Modify_Customer_Details
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);


% --- Outputs from this function are returned to the command line.
function varargout = Modify_Customer_Details_OutputFcn(hObject, eventdata, handles) 
% Get default command line output from handles structure
varargout{1} = handles.output;


% Callback function for reading typed string in edit1 textbox
function edit1_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% Callback function for reading typed string in edit2 textbox
function edit2_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% Callback function for reading typed string in edit3 textbox
function edit3_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% Callback function for reading typed string in edit4 textbox
function edit4_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% Callback function for reading typed string in edit5 textbox
function edit5_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% Callback function for reading typed string in edit7 textbox
function edit7_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
global unitPrice;
conn = database('nikkDb', 'sa', 'nikk', 'Vendor', 'MICROSOFT SQL SERVER', 'Server', '127.0.0.1', 'PortNumber', 1433, 'AuthType', 'Server');
MeterMobNum=get(handles.edit1,'String');
MeterMobNum=str2num(MeterMobNum);
BillingMobNum=get(handles.edit2,'String');
BillingMobNum=str2num(BillingMobNum);
cusName=get(handles.edit3,'String');
cusAddr=get(handles.edit4,'String');
prevData=get(handles.edit5,'String');
prevData=str2num(prevData);
curData=get(handles.edit7,'String');
curData=str2num(curData);
unitData=curData-prevData;
billAmt=unitData*unitPrice;
colnames={'MeterMobNum','BillingMobNum','CustomerName','CustomerAddr','PrevReading','CurReading','Units','BillAmount'};
exdata={MeterMobNum,BillingMobNum,cusName,cusAddr,prevData,curData,unitData,billAmt};
set(conn,'AutoCommit','off');
mobCond=sprintf('where MeterMobNum=%d',MeterMobNum);
update(conn,'energyDatabase',colnames,exdata,mobCond);
commit(conn);
close(conn);
close Modify_Customer_Details;

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
close Modify_Customer_Details;
