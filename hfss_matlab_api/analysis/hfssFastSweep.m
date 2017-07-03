% ----------------------------------------------------------------------------
% function hfssInterpolatingSweep(fid, Name, SolutionName, fStartGHz, ...
%                                fStopGHz, [nPoints = 1000], [nMaxSols = 101], 
%                                [iTol = 0.5])
% 此处的注释是错误的，这个注释是Interpolating扫频的，不是Fast扫频的
% 
% Description :
% -------------
% Create the VB Script necessary to add an interpolating sweep to an existing
% solution.
% 
% Parameters :
% ------------
% fid          - file identifier of the HFSS script file.
% Name         - name of the fast sweep.
% SolutionName - name of the solution to which this fast sweep needs
%                to be added.
% fStartGHz    - starting frequency of sweep in GHz.
% fStopGHz     - stop frequency of sweep in GHz.
%
% Note :
% ------
%
% Example :
% ---------
%
% ----------------------------------------------------------------------------

% ----------------------------------------------------------------------------
% This file is part of HFSS-MATLAB-API.
%
% HFSS-MATLAB-API is free software; you can redistribute it and/or modify it 
% under the terms of the GNU General Public License as published by the Free 
% Software Foundation; either version 2 of the License, or (at your option) 
% any later version.
%
% HFSS-MATLAB-API is distributed in the hope that it will be useful, but 
% WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
% or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License 
% for more details.
%
% You should have received a copy of the GNU General Public License along with
% Foobar; if not, write to the Free Software Foundation, Inc., 59 Temple 
% Place, Suite 330, Boston, MA  02111-1307  USA
%
% Copyright 2004, Vijay Ramasami (rvc@ku.edu)
% ----------------------------------------------------------------------------

function hfssFastSweep(fid, Name, SolutionName, fStartGHz, ...
                                fStopGHz,stepSize)

% arguments processor.
if (nargin < 5)
	error('Insufficient # of arguments');
elseif (nargin < 6)
	stepSize = 0.1
end;



% create script.
fprintf(fid, '\n');
fprintf(fid, 'Set oModule = oDesign.GetModule("AnalysisSetup")\n');

fprintf(fid, 'oModule.InsertDrivenSweep _\n');
fprintf(fid, '"%s", _\n', SolutionName);
fprintf(fid, 'Array("NAME:%s", _\n', Name);
fprintf(fid, '"Type:=", "Fast", _\n');
fprintf(fid, '"SetupType:=", "LinearStep", _\n');
fprintf(fid, '"StartFreq:=", "%fGHz", _\n', fStartGHz);
fprintf(fid, '"StopFreq:=", "%fGHz", _\n', fStopGHz);
fprintf(fid, '"StepSize:=","%fGHz", _\n',stepSize);
fprintf(fid, '"SaveFields:=", true, _\n');
fprintf(fid, '"ExtrapToDC:=", false)\n');