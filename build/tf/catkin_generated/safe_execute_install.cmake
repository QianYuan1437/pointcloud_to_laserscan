execute_process(COMMAND "/home/zhao/WS/msfl_ws/build/tf/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/zhao/WS/msfl_ws/build/tf/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
