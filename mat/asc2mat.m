function [  ] = asc2mat( input_folder, output_folder )
%ASC2MAT Convert the .asc files of a folder into .mat files
%   asc2mat(INPUT_FOLDER, OUTPUT_FOLDER) converts all the .asc files in the
%   folder INPUT_FOLDER into .mat files in the folder OUTPUT_FOLDER.
%   
%   See also ASC_READ.
    
    % Get the list of files and folders in the input folder
    info = dir(input_folder);
    
    for k = 1:length(info)
        input_filename = fullfile(input_folder, info(k).name);
        [~, name, ext] = fileparts(input_filename);
        if strcmp(ext, '.asc')
            output_filename = fullfile(output_folder, [name, '.mat']);
            A = asc_read(input_filename);
            save(output_filename, 'A', '-mat');
            disp(['convert ', input_filename]);
            disp(['     to ', output_filename]);
        end
    end
    
end

