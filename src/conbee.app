%% This is the application resource file (.app file) for the 'base'
%% application.
{application, conbee,
[{description, "conbee controller" },
{vsn, "1.0.0" },
{modules, 
	  [conbee,conbee_app,conbee_sup,conbee_server,lib_conbee]},
{registered,[conbee]},
{applications, [kernel,stdlib]},
{mod, {conbee_app,[]}},
{start_phases, []},
{git_path,"https://github.com/joq62/conbee.git"},
{env,[{ip,"192.168.0.203"},
      {port,80},
      {crypto,"0BDFAC94EE"},
      {cmd_sensors,"/api/0BDFAC94EE/sensors"}]}
]}.
