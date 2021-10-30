%%% -------------------------------------------------------------------
%%% @author  : JoqErlang
%%% @version "1.0.0" 
%%% @since 2021-07-20
%%% @doc: logger support for joqs infrastructure
%%% @copyright : JoqErlang 
%%% -------------------------------------------------------------------
-module(conbee). 

%% --------------------------------------------------------------------
%% Include files
%% --------------------------------------------------------------------

%% --------------------------------------------------------------------
%% Key Data structures
%% 
%% --------------------------------------------------------------------

%% --------------------------------------------------------------------
%% Definitions 
%% --------------------------------------------------------------------
-define(SERVER,conbee_server).
%% --------------------------------------------------------------------
-export([
	 sensors_raw/0,
	 sensors/0,
	 ping/0
	]).

-export([
	 boot/0,
	 start/0,
	 stop/0
	]).


%% ====================================================================
%% External functions
%% ====================================================================




%% Asynchrounus Signals
boot()->
    ok=application:start(?MODULE).
%% Gen server functions

start()-> gen_server:start_link({local, ?SERVER}, ?SERVER, [], []).
stop()-> gen_server:call(?SERVER, {stop},infinity).




%%---------------------------------------------------------------
-spec ping()-> {atom(),node(),module()}|{atom(),term()}.
%% 
%% @doc:check if service is running
%% @param: non
%% @returns:{pong,node,module}|{badrpc,Reason}
%%
ping()-> 
    gen_server:call(?SERVER, {ping},infinity).

sensors_raw()-> 
    gen_server:call(?SERVER, {sensors_raw},infinity).

sensors()-> 
    gen_server:call(?SERVER, {sensors},infinity).



%%----------------------------------------------------------------------
