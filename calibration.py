import tables

data_file_path = "../data/converted/rotation_224_v1/test_file_0.h5"


def normalize_and_rgb(images): 
    # Soruce: https://github.com/nhanvtran/MachineLearningNotebooks/blob/nvt/bwcustomweights-validate/project-brainwave/utils.py
	import numpy as np
    #normalize image to 0-255 per image.
    image_sum = 1/np.sum(np.sum(images,axis=1),axis=-1)
    given_axis = 0
    # Create an array which would be used to reshape 1D array, b to have 
    # singleton dimensions except for the given axis where we would put -1 
    # signifying to use the entire length of elements along that axis  
    dim_array = np.ones((1,images.ndim),int).ravel()
    dim_array[given_axis] = -1
    # Reshape b with dim_array and perform elementwise multiplication with 
    # broadcasting along the singleton dimensions for the final output
    image_sum_reshaped = image_sum.reshape(dim_array)
    images = images*image_sum_reshaped*255

    # make it rgb by duplicating 3 channels.
    images = np.stack([images, images, images],axis=-1)
    
    return images

def read_image(iter):
	f = tables.open_file(data_file_path, 'r')
	images = np.array(f.root.img_pt)
	print("calibration.read_image: got data with shape", images.shape())
	images = normalize_and_rgb(images)
	return {"Placeholder": images}
