cmake_minimum_required(VERSION 3.16)

project(Protify_analogue VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.6 REQUIRED COMPONENTS Multimedia Quick)

qt_standard_project_setup()

qt_add_executable(appProtify_analogue
    main.cpp
    PlayerController.h
    PlayerController.cpp
)

qt_add_qml_module(appProtify_analogue
    URI Protify_analogue
    VERSION 1.0
    QML_FILES Main.qml
    QML_FILES AudioInfoiBox.qml
    QML_FILES ImageButton.qml

    # Add resources
    RESOURCES
    assets/icons/app_icon.png
    assets/images/song1.jpg
    assets/images/song2.jpg
    assets/images/song3.jpg

    assets/icons/next.png
    assets/icons/previous.png
    assets/icons/play.png
    assets/icons/pause.png

    assets/videos/video_1.mp4
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appProtify_analogue PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appProtify_analogue
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appProtify_analogue
    PRIVATE Qt6::Quick Qt6::Multimedia
)

include(GNUInstallDirs)
install(TARGETS appProtify_analogue
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
