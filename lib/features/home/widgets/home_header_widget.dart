import 'package:flutter/material.dart';
import '../../../core/widgets/ibl_logo_widget.dart';

class HomeHeaderWidget extends StatelessWidget {
  final String? userName;
  final String? userAvatarUrl;
  final VoidCallback? onAvatarTap;

  const HomeHeaderWidget({
    super.key,
    this.userName,
    this.userAvatarUrl,
    this.onAvatarTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 28, bottom: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF3C3C3C).withValues(alpha: 0.9),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left: iBL Logo with TOGETHER
         Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const IblLogoWidget(),
             
                Text(
                  'TOGETHER',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.8),
                    fontSize: 8,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          
          // Center: SAFZI Logo with checkmark in A
          Expanded(
            flex: 2,
            child: Center(
              child: _buildSafeziLogo(),
            ),
          ),
          // Right: User Avatar
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: onAvatarTap,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  child: userAvatarUrl != null
                      ? ClipOval(
                          child: Image.network(
                            userAvatarUrl!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                _buildDefaultAvatar(),
                          ),
                        )
                      : _buildDefaultAvatar(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSafeziLogo() {
    return Stack(
      alignment: Alignment.center,
      children: [
        const Text(
          'SAFZI',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        // Green checkmark in the 'A' - positioned in the center of the A
        Positioned(
          left: 20, // Adjust based on font size and letter spacing
          top: 6,
          child: Container(
            width: 10,
            height: 10,
            decoration: const BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check,
              color: Colors.white,
              size: 7,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDefaultAvatar() {
    return const Icon(
      Icons.person,
      color: Colors.white,
      size: 30,
    );
  }
}

