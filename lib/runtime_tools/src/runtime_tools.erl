%%
%% %CopyrightBegin%
%%
%% SPDX-License-Identifier: Apache-2.0
%% 
%% Copyright Ericsson AB 2005-2024. All Rights Reserved.
%% 
%% Licensed under the Apache License, Version 2.0 (the "License");
%% you may not use this file except in compliance with the License.
%% You may obtain a copy of the License at
%%
%%     http://www.apache.org/licenses/LICENSE-2.0
%%
%% Unless required by applicable law or agreed to in writing, software
%% distributed under the License is distributed on an "AS IS" BASIS,
%% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%% See the License for the specific language governing permissions and
%% limitations under the License.
%% 
%% %CopyrightEnd%
%%
%% Description: Callback module for the runtime_tools application.
%%  ----------------------------------------------------------------------------

-module(runtime_tools).
-moduledoc false.
-behaviour(application).

-export([start/2,stop/1]).


%% -----------------------------------------------------------------------------
%% Callback functions for the runtime_tools application
%% -----------------------------------------------------------------------------
start(_,AutoModArgs) ->
    case supervisor:start_link({local,runtime_tools_sup},
			       runtime_tools_sup,
			       AutoModArgs) of
	{ok, Pid} ->
	    {ok, Pid, []};
	Error ->
	    Error
    end.

stop(_) ->
    ok.
%% -----------------------------------------------------------------------------






