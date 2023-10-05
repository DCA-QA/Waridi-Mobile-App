import 'package:flutter/material.dart';

class BlogScreen extends StatelessWidget {
  // Sample blog data (you can replace this with your own data)
  final List<BlogPost> blogPosts = [
    BlogPost(
      title: 'Together we create',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla viverra libero euismod tortor dictum, euismod.',
      imageUrl:
          'https://picsum.photos/500/300?random=10',
    ),
    BlogPost(
      title: 'A sign youve been looking for',
      description:
          'Sed auctor, odio a euismod dapibus, est nunc semper lorem, a volutpat.',
      imageUrl:
          'https://picsum.photos/500/300?random=9',
    ),
    BlogPost(
      title: 'Mountains ',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla viverra libero euismod tortor dictum, euismod.',
      imageUrl:
          'https://picsum.photos/500/300?random=8',
    ),
    BlogPost(
      title: 'How to dress your daughter',
      description:
          'Sed auctor, odio a euismod dapibus, est nunc semper lorem, a volutpat.',
      imageUrl:
          'https://picsum.photos/500/300?random=7',
    ),
    BlogPost(
      title: 'Ladies dresses',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla viverra libero euismod tortor dictum, euismod.',
      imageUrl:
          'https://picsum.photos/500/300?random=6',
    ),
    BlogPost(
      title: 'Hiking dresses',
      description:
          'Sed auctor, odio a euismod dapibus, est nunc semper lorem, a volutpat.',
      imageUrl:
          'https://picsum.photos/500/300?random=1',
    ),
    BlogPost(
      title: 'Together we create',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla viverra libero euismod tortor dictum, euismod.',
      imageUrl:
          'https://picsum.photos/500/300?random=2',
    ),
    BlogPost(
      title: 'Sign youv been looking for',
      description:
          'Sed auctor, odio a euismod dapibus, est nunc semper lorem, a volutpat.',
      imageUrl:
          'https://picsum.photos/500/300?random=3',
    ),
    BlogPost(
      title: 'Up the mountain down the valley',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla viverra libero euismod tortor dictum, euismod.',
      imageUrl:
          'https://picsum.photos/500/300?random=4',
    ),
    BlogPost(
      title: 'Dress Like a star',
      description:
          'Sed auctor, odio a euismod dapibus, est nunc semper lorem, a volutpat.',
      imageUrl:
          'https://picsum.photos/500/300?random=5',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Blog'),
        automaticallyImplyLeading: true,
      ),
      body: ListView.builder(
        itemCount: blogPosts.length,
        itemBuilder: (context, index) {
          final post = blogPosts[index];
          return GestureDetector(
            child: BlogCard(
              title: post.title,
              description: post.description,
              imageUrl: post.imageUrl,
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/blogsDetails',
              );
            },
          );
        },
      ),
    );
  }
}

class BlogPost {
  final String title;
  final String description;
  final String imageUrl;

  BlogPost(
      {required this.title, required this.description, required this.imageUrl});
}

class BlogCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  BlogCard({
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(
            imageUrl,
            height: 150,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
