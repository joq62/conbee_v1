%% This is the application resource file (.app file) for the 'base'
%% application.
{application, conbee,
[{description, "conbee controller" },
{vsn, "1.0.0" },
{modules, 
	  [conbee,conbee_sup,conbee_server]},
{registered,[conbee]},
{applications, [kernel,stdlib]},
{mod, {conbee,[]}},
{start_phases, []}
]}.
