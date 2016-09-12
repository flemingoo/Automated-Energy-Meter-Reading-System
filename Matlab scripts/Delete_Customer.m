% DELETE_CUSTOMER MATLAB code for Delete_Customer.fig
function varargout = Delete_Customer(varargin)
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Delete_Customer_OpeningFcn, ...
                   'gui_OutputFcn',  @Delete_Customer_OutputFcn, ...
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


% --- Executes just before Delete_Customer is made visible.
function Delete_Customer_OpeningFcn(hObject, eventdata, handles, varargin)
% Choose default command line output for Delete_Customer
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);


% --- Outputs from this function are returned to the command line.
function varargout = Delete_Customer_OutputFcn(hObject, eventdata, handles) 
% Get default command line output from handles structure
varargout{1} = handles.output;


% Callback function for reading typed string in edit1 textbox
function edit1_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
close Delete_Customer;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
delCusNum=get(handles.edit1,'String');
conn = database('nikkDb', 'sa', 'nikk', 'Vendor', 'MICROSOFT SQL SERVER', 'Server', '127.0.0.1', 'PortNumber', 1433, 'AuthType', 'Server');
setdbprefs('DataReturnFormat','cellarray');
sqlquery=['DELETE FROM energyDatabase WHERE MeterMobNum=',delCusNum];
curs=exec(conn,sqlquery);
close(curs);
close(conn);
close Delete_Customer;
