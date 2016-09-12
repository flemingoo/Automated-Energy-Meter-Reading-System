% APP_GUI MATLAB code for App_gui.fig

function varargout = App_gui(varargin)
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @App_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @App_gui_OutputFcn, ...
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


% --- This function executes just before App_gui is made visible.
function App_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% Choose default command line output for App_gui
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
% Deletes the COM5 port object, if it is there
delete(instrfind({'Port'},{'COM5'}));
clear sPort;
% Declaring a new COM5 port object named sPort
global sPort;
sPort =serial('COM5','BaudRate',9600);
fopen(sPort);
% Setting the terminator as '#',since GSM msg format is <CR><LF>messege<CR><LF>
set(sPort,'Terminator',35);
record(sPort,'on');
% Interrupt and its callback function, if terminator is detected
sPort.BytesAvailableFcnMode = 'terminator';
sPort.BytesAvailableFcn = @Serial_Callback;
global unitPrice;

% Adding the path of JDBC drivers
javaaddpath 'C:\Program Files\Microsoft JDBC Driver 4.0 for SQL Server\sqljdbc_4.0\enu\sqljdbc.jar';
javaaddpath 'C:\Program Files\Microsoft JDBC Driver 4.0 for SQL Server\sqljdbc_4.0\enu\sqljdbc4.jar';

% Creating new database object and connecting it to database named nikkDb
% on the host computer
conn = database('nikkDb', 'sa', 'nikk', 'Vendor', 'MICROSOFT SQL SERVER', 'Server', '127.0.0.1', 'PortNumber', 1433, 'AuthType', 'Server');
% The data return format of conn is set as cellarray
setdbprefs('DataReturnFormat','cellarray');
% SQL query for reading the mentioned columns from the table energyDatabase
sqlquery = ['select MeterMobNum,CustomerName,PrevReading,CurReading,Units,BillAmount from energyDatabase '];
curs = exec(conn,sqlquery);
curs = fetch(curs);
b=curs.Data;
% Updating the fetched to the uitable in application GUI
set(handles.uitable1,'Data',b);
% Closing database objects
close(curs);
close(conn);

% --- Outputs from this function are returned to the command line.
function varargout = App_gui_OutputFcn(hObject, eventdata, handles) 


% Callback function for popup menu
function popupmenu1_Callback(hObject, eventdata, handles)
popObj=get(hObject,'string');
popContent=popObj{get(hObject,'Value')};
if (strcmp(popContent,'Add new customer')==1)
     newCustomerFig;
else if (strcmp(popContent,'Modify Customer Details')==1)
     Modify_Customer_Details;
else if (strcmp(popContent,'Delete Customer')==1)
     Delete_Customer; 
    end
    end
end


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% Callback function for 'search by mobile number' edit text box
function edit1_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% Callback function for 'search by customer name' edit text box
function edit2_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% Callback function for the pushbuttonn 'search by mobile number'
function pushbutton1_Callback(hObject, eventdata, handles)
% Getting the typed string from edit1 textbox
searchText=get(handles.edit1,'String');
conn = database('nikkDb', 'sa', 'nikk', 'Vendor', 'MICROSOFT SQL SERVER', 'Server', '127.0.0.1', 'PortNumber', 1433, 'AuthType', 'Server');
setdbprefs('DataReturnFormat','cellarray');
sqlquery=['select MeterMobNum,CustomerName,PrevReading,CurReading,Units,BillAmount from energyDatabase where MeterMobNum = ',searchText];
curs=exec(conn,sqlquery);
curs=fetch(curs);
b=curs.Data;
set(handles.uitable1,'Data',b);
close(curs);
close(conn);



% Callback function for the pushbuttonn 'search by customer name'
function pushbutton2_Callback(hObject, eventdata, handles)
searchText=get(handles.edit2,'String');
conn = database('nikkDb', 'sa', 'nikk', 'Vendor', 'MICROSOFT SQL SERVER', 'Server', '127.0.0.1', 'PortNumber', 1433, 'AuthType', 'Server');
setdbprefs('DataReturnFormat','cellarray');
% ascii of single quotes ( ' ) is 39
sqlquery=sprintf('select MeterMobNum,CustomerName,PrevReading,CurReading,Units,BillAmount from energyDatabase where CustomerName =%c%s%c',39,searchText,39);
curs=exec(conn,sqlquery);
curs=fetch(curs);
b=curs.Data;
set(handles.uitable1,'Data',b);
close(curs);
close(conn);

% Callback function for uitable in the application GUI
function uitable1_ButtonDownFcn(hObject, eventdata, handles)
delete(instrfind({'Port'},{'COM5'}));
clear sPort;
global sPort;
sPort =serial('COM5','BaudRate',9600);
fopen(sPort);
set(sPort,'Terminator',35);
record(sPort,'on');
sPort.BytesAvailableFcnMode = 'terminator';
sPort.BytesAvailableFcn = @Serial_Callback;
conn = database('nikkDb', 'sa', 'nikk', 'Vendor', 'MICROSOFT SQL SERVER', 'Server', '127.0.0.1', 'PortNumber', 1433, 'AuthType', 'Server');
setdbprefs('DataReturnFormat','cellarray');
sqlquery = ['select MeterMobNum,CustomerName,PrevReading,CurReading,Units,BillAmount from energyDatabase '];
curs = exec(conn,sqlquery);
curs = fetch(curs);
b=curs.Data;
set(handles.uitable1,'Data',b);
close(curs);
close(conn);

% Callback function for reading the serial data, if terminator is detected
function Serial_Callback(sObject,event)
unitPrice=4;
sData=fgets(sObject);
sWords=strsplit(sData)
% Stores the energy units to database if the message contains the keyword CUSTOMERID
if sWords{4}=='CUSTOMERID'
	conn = database('nikkDb', 'sa', 'nikk', 'Vendor', 'MICROSOFT SQL SERVER', 'Server', '127.0.0.1',..
	'PortNumber', 1433, 'AuthType', 'Server');
    % Turning off fast insert
	set(conn,'AutoCommit','off');
    % sprintf for string formatting
	mobCond=sprintf('where MeterMobNum=%s',sWords{5});
	sCurData=str2num(sWords{7});
	setdbprefs('DataReturnFormat','cellarray');
	sqlquery = ['select PrevReading,CurReading from energyDatabase ',mobCond];
	curs = exec(conn,sqlquery);
	curs = fetch(curs);
	b=curs.Data;
	unitData=sCurData-b{1};
	billAmt=unitData*unitPrice;
	colNames={'CurReading','Units','BillAmount'};
	exData={sCurData,unitData,billAmt};
	update(conn,'energyDatabase',colNames,exData,mobCond);
	commit(conn);
	close(curs);
	close(conn);
end

% --- Executes on 'Generate bill by customer' button press.
function pushbutton3_Callback(hObject, eventdata, handles)
Bill_by_Customer; % calling mfile


% --- Executes on 'Generate bill for all customer' button press.
function pushbutton4_Callback(hObject, eventdata, handles)
global sPort;
conn = database('nikkDb', 'sa', 'nikk', 'Vendor', 'MICROSOFT SQL SERVER', 'Server', '127.0.0.1', 'PortNumber', 1433, 'AuthType', 'Server');
setdbprefs('DataReturnFormat','cellarray');
sqlquery=['select MeterMobNum,BillingMobNum,CurReading,Units,BillAmount from energyDatabase'];
curs=exec(conn,sqlquery);
curs=fetch(curs);
b=curs.Data;
colNames={'PrevReading'};
% Finding number customers in the table
n=sprintf('SELECT COUNT(DISTINCT %d) FROM energyDatabase',MeterMobNum);
% Sends message containing bill amount to all customers
for i=1:n
    exData={b{i,3}};
    mobCond=sprintf('where MeterMobNum=%s',b{i,1});
    % Updating the database table values
    update(conn,'energyDatabase',colNames,exData,mobCond);
    % ascii of <CR> is 13
	CR=char(13);
    % ascii of 'control + z' is 26
	ctrlz=char(26);
    % Sending AT commands for sending bill amount to COM5
	CMGS=sprintf('AT+CMGS="+91%s"',b{i,2});
	billMsg=sprintf('Bill Amount: %d',b{i,5});
	fprintf(sPort,'%s',CMGS);
	fprintf(sPort,'%s',CR);
	pause(2);
	fprintf(sPort,'%s',billMsg);
	fprintf(sPort,'%s',ctrlz);
    % Delay of 2 seconds
	pause(2);    
end
% Saving the changes in the table values
commit(conn);
close(curs);
close(conn);


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
delete(instrfind({'Port'},{'COM5'}));
% delete(hObject) closes the figure
delete(hObject);

% --- Executes during object deletion, before destroying properties.
function pushbutton3_DeleteFcn(hObject, eventdata, handles)

% --- Executes during object deletion, before destroying properties.
function pushbutton4_DeleteFcn(hObject, eventdata, handles)

% --- Executes when selected cell(s) is changed in uitable1.
function uitable1_CellSelectionCallback(hObject, eventdata, handles)

% --- Executes when cell(s) is pressed in uitable1.
function uitable1_KeyPressFcn(hObject, eventdata, handles)

