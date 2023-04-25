function [x, t] = importSignal(this, options)
    % MULTISCALEELECTROPHYSIOLOGYDATA_1P0.IMPORTSIGNAL imports MED 1.0 signal into MATLAB
    %
    % Syntax:
    %   [x, t] = importSignal(this)
    %   [x, t] = importSignal(__, start_end)
    %   [x, t] = importSignal(__, start_end, st_unit)
    %   [x, t] = importSignal(__, start_end, st_unit, filepath)
    %   [x, t] = importSignal(__, start_end, st_unit, filepath, filename)
    %   [x, t] = importSignal(__, 'Level1Password', level_1_pw)
    %   [x, t] = importSignal(__, 'Level2Password', level_2_pw)
    %   [x, t] = importSignal(__, 'AccessLevel', access_level)
    %
    % Input(s):
    %   this            - [obj] MultiscaleElectrophysiologyData_1p0 object
    %   start_end       - [1 x 2 array] (opt) [start time/index, end time/index] of
    %                     the signal to be extracted fromt the file (default:
    %                     the entire signal)
    %   st_unit         - [str] (opt) unit of start_end: 'Index' (default), 'uUTC',
    %                     'Second', 'Minute', 'Hour', and 'Day'
    %   filepath        - [str] (opt) directory of the session
    %   filename        = [str] (opt) filename of the channel
    %   level_1_pw      - [str] (para) password of level 1 (default = this.Level1Password)
    %   level_2_pw      - [str] (para) password of level 2 (default = this.Level2Password)
    %   access_level    - [str] (para) data decode level to be used
    %                     (default = this.AccessLevel)
    %
    % Output(s):
    %   x               - [num array] extracted signal
    %   t               - [num array] time indices of the signal in the file
    %
    % Example:
    %
    % Note:
    %   Import data from one channel of MED 1.0 file into MatLab.
    %
    % References:
    %
    % See also .

    % Copyright 2023 Richard J. Cui. Created: Thu 04/20/2023 12:24:33.818 AM
    % $Revision: 0.1 $  $Date: Thu 04/20/2023 12:24:33.825 AM $
    %
    % Rocky Creek Dr. NE
    % Rochester, MN 55906, USA
    %
    % Email: richard.cui@utoronto.ca

    % ======================================================================
    % parse inputs
    % ======================================================================
    arguments
        this (1, 1) MultiscaleElectrophysiologyData_1p0
    end % positional

    arguments
        options.start_end (1, 2) double {mustBeNonnegative} = [0, inf]
        options.st_unit (1, 1) string {mustBeMember(options.st_unit, ["Index", "uUTC", "Second", "Minute", "Hour", "Day"])} = "Index"
        options.filepath (1, 1) string = string.empty(1, 0)
        options.filename (1, 1) string = string.empty(1, 0)
        options.level_1_pw (1, 1) string = this.Level1Password
        options.level_2_pw (1, 1) string = this.Level2Password
        options.access_level (1, 1) string = this.AccessLevel
    end % optional

    % ======================================================================
    % main
    % ======================================================================
    % parameters
    % ----------
    start_end = options.start_end;
    st_unit = options.st_unit;
    filepath = options.filepath;
    filename = options.filename;
    l1_pw = options.level_1_pw;
    l2_pw = options.level_2_pw;
    al = options.access_level;

    % password
    % --------
    if isnan(l1_pw)
        l1_pw = this.Level1Password;
    else
        this.Level1Password = l1_pw;
    end % if

    if isnan(l2_pw)
        l2_pw = this.Level2Password;
    else
        this.Level2Password = l2_pw;
    end % if

    if isnan(al)
        al = this.AccessLevel;
    else
        this.AccessLevel = al;
    end % if

    pw = this.processPassword('Level1Password', l1_pw, ...
        'Level2Password', l2_pw, ...
        'AccessLevel', al);

end % function importSignal

% [EOF]
