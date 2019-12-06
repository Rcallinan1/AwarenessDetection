function [outputArg1] = EyeStatus(inputArg1,inputArg2,inputArg3)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
           biggest_box_eyes = inputArg2;
           bboxeyes = inputArg3;
            eye = imadjust(rgb2gray(inputArg1));    %adjust contrast
            bboxeyeshalf=[bboxeyes(biggest_box_eyes,1),bboxeyes(biggest_box_eyes,2),bboxeyes(biggest_box_eyes,3)/3,bboxeyes(biggest_box_eyes,4)];   %resize the eyepair width in half
             r = bboxeyeshalf(1,4)/4;
             [centers, radii, metric] = imfindcircles(eye, [floor(r-r/4) floor(r+r/2)], 'ObjectPolarity','dark', 'Sensitivity', 0.93); % Hough Transform
             [M,I] = sort(radii, 'descend');
                 
             eyesPositions = centers;
                 
                          
             if ~isempty(centers)
                pupil_x=centers(1);
                disL=abs(0-pupil_x);    %distance from left edge to center point
                disR=abs(bboxeyes(1,3)/3-pupil_x);%distance from right edge to center point
                if disL>disR+16
                    outputArg1 = "Looking Right";
                else if disR>disL
                    outputArg1 = "Looking Left";
                else
                       outputArg1 = "Looking Straight"; 
                    end
                end
     
             end          

end

