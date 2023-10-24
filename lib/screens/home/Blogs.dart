import 'package:flutter/material.dart';

import '../models/others/blogpost.dart';
import '../widgets/blogs-card.dart';
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

class BlogScreen extends StatelessWidget {
  // Sample blog data (you can replace this with your own data)
  

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


