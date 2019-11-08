function outstr = substr(str, offset, len, repl)
%SUBSTR Extracts a substring out of a string.
%
%   SUBSTR(STRING, OFFSET, LENGTH) extracts a substring out of STRING with
%   given LENGTH starting at the given OFFSET.  First character is at offset 0.
%   If OFFSET is negative, starts that far from the end of the string.  If
%   LENGTH is omitted, returns everything to the end of the string.  If LENGTH
%   is negative, removes that many characters from the end of the string.
%
%   SUBSTR(STRING, OFFSET, LENGTH, REPLACEMENT) will not return the substring
%   as specified by STRING, OFFSET, and LENGTH (see above) but rather replace
%   it by REPLACEMENT and return the result.
%
%   Examples:
%
%      Get first character:              substr(string,  0, 1)
%      Get last character:               substr(string, -1, 1)
%      Remove first character:           substr(string,  1)
%      Remove last character:            substr(string,  0, -1)
%      Remove first and last character:  substr(string,  1, -1)
%
%   SUBSTR is a MATLAB version of the Perl operator with the same name.
%   However, unlike Perl's SUBSTR, no warning is produced if the substring is
%   totally outside the string.
% 
% MITSUBISHI MELFA TOOLBOX v1.4
% (C) Peter J. Acklam
% 
% Mitsubishi Melfa Toolbox is free software: you can redistribute it and/or modify
% it under the terms of the GNU Lesser General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
% 
% Mitsubishi Melfa Toolbox is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU Lesser General Public License for more details.
% 
% You should have received a copy of the GNU Leser General Public License
% along with Mitsubishi Melfa Toolbox. If not, see <http://www.gnu.org/licenses/>.
% 
% Author:                  Revision:     Date:                    Reason:
% Peter J. Acklam                  1     21.2.2004 22:49:14       Published

 % Check number of input arguments.
 error(nargchk(2, 4, nargin));

 n = length(str);

 % Get lower index.
 lb = offset + 1;             % offset from beginning of string
 if offset < 0
    lb = lb + n;              % offset from end of string
 end
 lb = max(lb, 1);

 % Get upper index.
 if nargin == 2               % SUBSTR(STR, OFFSET)
    ub = n;
 elseif nargin > 2            % SUBSTR(STR, OFFSET, LEN)
    if len >= 0
       ub = lb + len - 1;
    else
       ub = n + len;
    end
    ub = min(ub, n);
 end

 % Extract or replace substring.
 if nargin < 4
    outstr = str(lb : ub);                        % extract substring
 else
    outstr = [str(1:lb-1) repl str(ub+1:end)];    % replace substring
 end

