%%
%% %CopyrightBegin%
%%
%% SPDX-License-Identifier: Apache-2.0
%%
%% Copyright Ericsson AB 2003-2021. All Rights Reserved.
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
%%
-module(testINSTANCE_OF).
-export([main/1]).

-include_lib("common_test/include/ct.hrl").

main(Erule) ->
    Int = roundtrip('Int', 3),

    ValotherName = {otherName,{'INSTANCE OF',{2,4},Int}},
    _ = roundtrip('GeneralName', ValotherName),

    case Erule of
        jer -> ok;
        _ ->
            VallastName1 = {lastName,{'GeneralName_lastName',{2,4},12}},
            _ = roundtrip('GeneralName', VallastName1),
            
            VallastName2 = {lastName,{'GeneralName_lastName',{2,3,4},
                                      {'Seq',12,true}}},
            _ = roundtrip('GeneralName', VallastName2),
            ok
    end.

roundtrip(T, V) ->
    asn1_test_lib:roundtrip_enc('INSTANCEOF', T, V).
