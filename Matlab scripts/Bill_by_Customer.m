% BILL_BY_CUSTOMER MATLAB code for Bill_by_Customer.fig
function varargout = Bill_by_Customer(varargin)
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Bill_by_Customer_OpeningFcn, ...
                   'gui_OutputFcn',  @Bill_by_Customer_OutputFcn, ...
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


% --- Executes just before Bill_by_Customer is made visible.
function Bill_by_Customer_OpeningFcn(hObject, eventdata, handles, varargin)
% Choose default command line output for Bill_by_Customer
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);


% --- Outputs from this function are returned to the command line.
function varargout = Bill_by_Customer_OutputFcn(hObject, eventdata, handles) 
% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
global sPort;
delete(instrfind({'Port'},{'COM5'}));
sPort =serial('COM5','BaudRate',9600);
fopen(sPort);
sPort.Terminator = 'CR';
searchText=get(handles.edit1,'String');
conn = database('nikkDb', 'sa', 'nikk', 'Vendor', 'MICROSOFT SQL SERVER', 'Server', '127.0.0.1', 'PortNumber', 1433, 'AuthType', 'Server');
setdbprefs('DataReturnFormat','cellarray');
sqlquery=['select BillingMobNum,CurReading,Units,BillAmount from energyDatabase where MeterMobNum = ',searchText];
curs=exec(conn,sqlquery);
curs=fetch(curs);
b=curs.Data;
colNames={'PrevReading'};
exData={b{2}};
mobCond=sprintf('where MeterMobNum=%s',searchText);
% Updating the database table values
update(conn,'energyDatabase',colNames,exData,mobCond);
% Saving the changes in the table values
commit(conn);
% Code for sending message through GSM module
CR=char(13);
ctrlz=char(26);
CMGS=sprintf('AT+CMGS="+91%s"',b{1,1});
billMsg=sprintf('Bill Amount: %d',b{1,4});
fprintf(sPort,'%s',CMGS);
fprintf(sPort,'%s',CR);
pause(2);
fprintf(sPort,'%s',billMsg);
fprintf(sPort,'%s',ctrlz);
pause(2);
% End of code for sending message
close Bill_by_Customer;
close(curs);
close(conn);



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% closing the figure window Bill_by_Customer
close Bill_by_Customer;
