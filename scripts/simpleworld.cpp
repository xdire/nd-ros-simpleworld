#include <gazebo/gazebo.hh>

namespace gazebo {

    class SimpleWorldPluginExample : public WorldPlugin {

      public:
        SimpleWorldPluginExample() : WorldPlugin() {
          printf("Hello Simple World!\n");
        }

        void Load(physics::WorldPtr world, sdf::ElementPtr sdf) {}
    };

    GZ_REGISTER_WORLD_PLUGIN(SimpleWorldPluginExample);

}
