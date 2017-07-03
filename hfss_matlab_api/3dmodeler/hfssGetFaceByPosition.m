function hfssGetFaceByPosition(fid,body,position,Units)
% Gets the ID of a face by position


% Parameters :
% ------------
% fid     - file identifier of the HFSS script file.
% body    - name of the body on which the point lies 
% position - the position in the coordinate of the point

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
fprintf(fid, '\n');
fprintf(fid, 'Dim oFaceID\n');
fprintf(fid, 'Set oFaceID = oEditor.GetFaceByPosition_\n');
fprintf(fid, 'Array("NAME:Parameters",_\n');
fprintf(fid, '"BodyName:=","%s",_\n',body);
fprintf(fid, '"Xposition:=", "%f%s",_\n',position(1),Units);
fprintf(fid, '"Yposition:=", "%f%s",_\n',position(2),Units);
fprintf(fid, '"Zposition:=", "%f%s")\n',position(3),Units);
fprintf(fid, '"Zposition:=", "%f%s")\n',position(3),Units);
