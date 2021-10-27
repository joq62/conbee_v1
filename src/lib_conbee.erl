%%% -------------------------------------------------------------------
%%% Author  : uabjle
%%% Description :  
%%% 
%%% Created : 10 dec 2012
%%% -------------------------------------------------------------------
-module(lib_conbee).    
     
%% --------------------------------------------------------------------
%% Include files
%% --------------------------------------------------------------------
%-include_lib("eunit/include/eunit.hrl").
%% --------------------------------------------------------------------



%% External exports
-export([start/0,
	get_temp/0,get_open_close/0,get_motion/0]). 


%% ====================================================================
%% External functions
%% ====================================================================


%% --------------------------------------------------------------------
%% Function:tes cases
%% Description: List of test cases 
%% Returns: non
%% --------------------------------------------------------------------
start()-> 

    ok.



%% --------------------------------------------------------------------
%% Function:start/0 
%% Description: Initiate the eunit tests, set upp needed processes etc
%% Returns: non
%% --------------------------------------------------------------------
-define(ConbeeAddr,"192.168.0.100").
-define(ConbeePort,80).
-define(Crypto,"0BDFAC94EE").
-define(Temp,"/api/0BDFAC94EE/sensors/14").
-define(OpenClose,"/api/0BDFAC94EE/sensors/11").
-define(Motion,"/api/0BDFAC94EE/sensors/12").


%% --------------------------------------------------------------------
%% Function:start/0 
%% Description: Initiate the eunit tests, set upp needed processes etc
%% Returns: non
%% --------------------------------------------------------------------

%% --------------------------------------------------------------------
%% Function:start/0 
%% Description: Initiate the eunit tests, set upp needed processes etc
%% Returns: non
%% --------------------------------------------------------------------
get_temp()->
    {ok, ConnPid} = gun:open(?ConbeeAddr,?ConbeePort),
    Ref=gun:get(ConnPid,?Temp),
    Result= get_temp(gun:await_body(ConnPid, Ref)),
    ok=gun:close(ConnPid),
    Result.
get_temp({ok,Body})->
    get_temp(Body);
get_temp(Body)->
     X1=jsx:decode(Body,[]),
    true=is_map(X1),
    Z=maps:get(<<"state">>,X1),
    true=is_map(Z),
    Temp=maps:get(<<"temperature">>,Z),
    float_to_list(Temp/100,[{decimals,1}]).   

%% --------------------------------------------------------------------
%% Function:start/0 
%% Description: Initiate the eunit tests, set upp needed processes etc
%% Returns: non
%% --------------------------------------------------------------------
get_open_close()->
    {ok, ConnPid} = gun:open(?ConbeeAddr,?ConbeePort),
    Ref=gun:get(ConnPid,?OpenClose),
    Result= get_open_close(gun:await_body(ConnPid, Ref)),
    ok=gun:close(ConnPid),
    Result.


get_open_close({ok,Body})->
    get_open_close(Body);
get_open_close(Body)->
    X1=jsx:decode(Body,[]),
    true=is_map(X1),
    Z=maps:get(<<"state">>,X1),
    true=is_map(Z),
    case maps:get(<<"open">>,Z) of
	true->
	    "door is open";
	false ->
	    "door is closed"
    end.

%% --------------------------------------------------------------------
%% Function:start/0 
%% Description: Initiate the eunit tests, set upp needed processes etc
%% Returns: non
%% --------------------------------------------------------------------
get_motion()->
    {ok, ConnPid} = gun:open(?ConbeeAddr,?ConbeePort),
    Ref=gun:get(ConnPid,?Motion),
    Result= get_motion(gun:await_body(ConnPid, Ref)),
    ok=gun:close(ConnPid),
    Result.

get_motion({ok,Body})->
    get_motion(Body);
get_motion(Body)->
     X1=jsx:decode(Body,[]),
    true=is_map(X1),
    Z=maps:get(<<"state">>,X1),
    true=is_map(Z),
    case maps:get(<<"presence">>,Z) of
	true->
	    "motion";
	false ->
	    "no motion"
    end.

%% --------------------------------------------------------------------
%% Function:start/0 
%% Description: Initiate the eunit tests, set upp needed processes etc
%% Returns: non
%% --------------------------------------------------------------------
