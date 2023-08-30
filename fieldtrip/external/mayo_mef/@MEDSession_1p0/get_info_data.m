function [sess_info, unit] = get_info_data(this)
    % MEDSESSION_1P0.GET_INFO_DATA get session info from data
    %
    % Syntax:
    %   [sessionifo, unit] = get_info_data(this)
    %
    % Input(s):
    %   sess_info       - [table] N x 14 tabel: 'ChannelName', 'SamplingFreq',
    %                     'Begin', 'Stop', 'Samples' 'IndexEntry',
    %                     'DiscountinuityEntry', 'SubjectEncryption',
    %                     'SessionEncryption', 'DataEncryption', 'Version',
    %                     'Institution', 'SubjectID', 'AcquistitionSystem',
    %                     'CompressionAlgorithm', 'Continuity', where N is the
    %                     number of channels.
    %   unit            - [str] unit of begin_stop: 'Index' (default), 'uUTC',
    %                     'Second', 'Minute', 'Hour', and 'Day'
    %
    % Output(s):
    %
    % Example:
    %
    % Note:
    %
    % References:
    %
    % See also .

    % Copyright 2023 Richard J. Cui. Created: Tue 02/21/2023 11:27:28.805 PM
    % $Revision: 0.1 $  $Date: Tue 02/21/2023 11:27:28.806 PM $
    %
    % Rocky Creek Dr. NE
    % Rochester, MN 55906, USA
    %
    % Email: richard.cui@utoronto.ca

    % =========================================================================
    % main
    % =========================================================================
    var_names = {'ChannelName', 'SamplingFreq', 'Begin', 'Stop', 'Samples', ...
                     'IndexEntry', 'DiscountinuityEntry', 'SubjectEncryption', ...
                     'SessionEncryption', 'DataEncryption', 'Version', 'Institution', ...
                     'SubjectID', 'AcquisitionSystem', 'CompressionAlgorithm', 'Continuity'};
    var_types = {'string', 'double', 'double', 'double', 'double', 'double', ...
                     'double', 'logical', 'logical', 'logical', 'string', 'string', 'string', ...
                     'string', 'string', 'cell'};

    % get the meta data
    % -----------------
    metadata = this.MetaData;

    if isempty(metadata) == true % no metadata
        metadata = this.read_med_session_metadata_1p0();
        this.MetaData = metadata;
    end % if

    % get session info
    % ----------------
    % TODO
end % function get_info_data

% [EOF]
