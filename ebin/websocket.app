{application, 'websocket', [
	{description, "Cowboy Websocket example"},
	{vsn, "1"},
	{modules, ['conbee','conbee_app','conbee_control','conbee_server','conbee_sup','sensors']},
	{registered, []},
	{applications, [kernel,stdlib,cowboy]},
	{env, []}
]}.