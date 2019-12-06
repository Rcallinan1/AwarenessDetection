function [result] = main(inputImage)
    [eye, bigEyes, bbEyes] = GetEye(inputImage);
    result = EyeStatus(eye,bigEyes,bbEyes);
end

