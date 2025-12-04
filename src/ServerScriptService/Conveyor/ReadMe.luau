--[[

    README for Conveyor System

    This Conveyor System module is designed to simulate a baggage handling system.
    It includes a Dropper that spawns baggage items at specified intervals.

    Features:
    - Dropper: Spawns baggage items at a defined drop time interval. (affected by UI slider by first client interaction)
    - Destroyer: Removes baggage items that reach a certain point in the conveyor system.
    - Baggage Items: Each baggage item is tagged and can be interacted with.

    Note:
    - The baggage items are assigned random colors and materials upon creation
    - Interaction with baggage items is handled via client scripts.
    - I noticed that the `Maximum 30 bags in the world` was crossed out, 
        I wasn't sure if that meant I shouldn't include it.
        I can include them if needed, just let me know.

    Addition Notes:

    I chose to implement this system that way I did so that I could further show my understanding of Roblox development principles,
    including the use of RemoteEvents for client-server communication, CollectionService for tagging and managing game objects,
    and modular scripting for better code organization and reusability.

    - Please take into consideration, as I was working on this project, I realized that there are many 
    improvements that could be made to optimize performance and enhance functionality. But due to time constraints
    at the time of reliazation, I had to limit the scope of this project. Future iterations could include features such as:
    * Including only dropper data to be on the server, while having the client handle all visual aspects.
    * Implementing a more sophisticated system for managing baggage items, such as pooling to reduce instance creation overhead.

    An additional strong point of mine that I wanted to highlight with this project includes the use of classes (Dropper and Destroyer) to encapsulate functionality related to specific game mechanics.
    (It helps that I quite enjoy OOP principles and patterns haha))
    Also the use of CollectionService to manage and identify baggage items efficiently.
        * I would've gone with GUID for baggage identification, but as I already had it server reliant, 
        I opted to go with a simpler, less-constraining approach of using incremental IDs per dropper instance.
        (save performance costs of generating GUIDs and storing them)

    Also an additional weak point of mine was that as I was quite eager to get started, I did not have a good understanding
    of exactly what was asked of me, as I did most of this on the server, which I know does NOT meet the ideal performance
    average and it wasn't a requirement, but as I strive to do the best, I wanted to note that I am aware of this and will
    improve on it in the future.

    Also, I want to note that I don't use AI tools to generate code for ANY of my projects. All code is written by me.
]]