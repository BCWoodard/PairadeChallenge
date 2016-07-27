#PairedChallenge

###Remote Images
I utilized SDWebImage to grab the remote images for the project. The advantage here is the library includes all the functionality needed to retrieve, display and cache the images quickly and efficiently. A disadvantage would be the introduction of a third party library into the app. Since we don’t control the library, it is possible that changes to the library could break the app.

###Mode 1
One image per row, stacked above one another.
- The solution for this option was to use a custom flow layout. While the collectionView would have displayed the images fine, implementing a custom flow layout allows for easier adjustments in the future. For example, a couple lines of code and you can change the collectionView from a single column to 2-, 3- or more.

###Mode 2
Multiple images per row, with some images as a large size and some as a smaller size, fitting together like a patchwork.
- The solution I attempted for this mode was to create a custom layout and implement a xib file for the layout in each row. A xib file can provide a graphical interface for very complex layouts and make adjustments to the layout very easy. Maintenance on this implementation is relatively easy but implementing this approach is a bit more complex. 