# A.I. A.I. agAIn

An A.I. generated novelisation of the film A.I. Artificial Intelligence.

This is a revisit of my [NaNoGenMo 2016](https://github.com/NaNoGenMo/2016/issues/44) entry for [NaNoGenMo 2024](https://github.com/NaNoGenMo/2024/issues/14) using current AI tools.

## Method

* I ripped the DVD to a file.
* I used ffmpeg to make stills for each chapter of the DVD at a rate of 1 every 8 seconds resulting in 1054 images.
* I'm using LLaVA 1.5 from here https://github.com/Mozilla-Ocho/llamafile running locally.
* This is the prompt I give it:
> <image> You are writing a novel, write a paragraph for it based on what you see in this image. Then write another, possibly with some dialogue between the people in the image if there are any. Stick to the style of a novel, don't write like a script, and never mention the scene or that there is an image. It is very important to never say image or talk as if you're describing an image.
* For the first image in a chapter I give the prompt and the image to LLaVA and record the resulting text.
* For the rest of the images I give it the prompt, the previous image's text and the image.
* Having generated the text for a chapter I read it and if I don't like it I can regenerate it.
* Similar to last time, the chapter titles are the most common word over 7 letters in the chapter that's not previously been a chapter title.
* Then I compile the text into markdown, and PDF using LaTeX.

## Result

[Markdown]() and [PDF]()

The resulting text this time is considerably more coherent and novel-like. Though despite my insistence on not mentioning the image in the prompt, it still insisted on dropping out of novel writing and reverting to image describing occasionally.

There are a few places where it recognises text in the still, not least in the first chapter where it spots the film's title and starts writing about the importance of AI ethics, appropriately enough. Also the final part of the last chapter, which is the end credits, becomes a self-congratulatory party for the cast and crew.

It's interesting how similar it is to the first version in some ways. It regularly mentions men in suits and people talking on cell phones. Though it's hard to tell if that's because they're based on the same film, or if it's due to the training set. I suspect more of the latter.

It's fairly repetitive, frequently starting with a man and a woman who proceed to say "I can't believe (situation)". Also it tends to descend into people having boring business meetings.

I don't think I'll be doing this again in another eight years. I strongly suspect we're well into the diminishing returns stage of large language models. Despite what some billionaires would have us believe, throwing more training data and power at LLMs is not about to cause them to wake up into full sentience.

I think repeating this with future tools will result in even blander results, AI was much more amusing back when it was shonkier. Ultimately, a model that basically averages all the text on the internet is not going to produce anything better than average.
