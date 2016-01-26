function annotateTrackedObject(frame, utilities, detectedLocation, trackedLocation, param)
  accumulateResults(frame, utilities, detectedLocation, trackedLocation);
  % Combine the foreground mask with the current video frame in order to
  % show the detection result.
  combinedImage = max(repmat(utilities.foregroundMask, [1,1,3]), frame);

  if ~isempty(trackedLocation)
    shape = 'circle';
    region = trackedLocation;
    region(:, 3) = 5; % use this directly to make bounding box?
    combinedImage = insertObjectAnnotation(combinedImage, shape, ...
      region, param.label, 'Color', 'red');
  end
  step(utilities.videoPlayer, combinedImage);
end
