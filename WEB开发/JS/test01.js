// 等待页面加载完成再执行
document.addEventListener('DOMContentLoaded', function() {
    
    // 获取元素
    const h1 = document.querySelector('h1');
    const p = document.querySelector('p');
    const img = document.querySelector('img');


    // ========== 1. 点击标题 - 随机变色 ==========
    h1.addEventListener('click', function() {
        const colors = ['#ff6b6b', '#4ecdc4', '#45b7d1', '#f9ca24', '#6c5ce7', '#a29bfe'];
        const randomColor = colors[Math.floor(Math.random() * colors.length)];
        this.style.color = randomColor;
        this.style.cursor = 'pointer';
    });

    // ========== 2. 双击段落 - 切换文字 ==========
    let isChanged = false;
    p.addEventListener('dblclick', function() {
        if (isChanged) {
            this.textContent = 'man!';
            isChanged = false;
        } else {
            this.textContent = 'Mamba Out! 🐍';
            isChanged = true;
        }
    });

    // ========== 3. 图片点击 - 放大/还原 ==========
    let isZoomed = false;
    img.addEventListener('click', function() {
        if (isZoomed) {
            this.style.height = '600px';
            this.style.transition = 'all 0.3s ease';
            isZoomed = false;
        } else {
            this.style.height = '800px';
            this.style.transition = 'all 0.3s ease';
            isZoomed = true;
        }
    });

    // ========== 4. 图片悬停 - 旋转效果 ==========
    img.addEventListener('mouseover', function() {
        this.style.transform = 'scale(1.05)';
        this.style.transition = 'transform 0.3s ease';
        this.style.cursor = 'pointer';
    });

    img.addEventListener('mouseout', function() {
        this.style.transform = 'scale(1)';
    });

    // ========== 5. 标题悬停 - 文字阴影效果 ==========
    h1.addEventListener('mouseover', function() {
        this.style.textShadow = '3px 3px 5px rgba(0,0,0,0.3)';
        this.style.transition = 'all 0.3s ease';
    });

    h1.addEventListener('mouseout', function() {
        this.style.textShadow = 'none';
    });

    // ========== 6. 页面点击计数器 ==========
    let clickCount = 0;
    document.body.addEventListener('click', function(e) {
        clickCount++;
        console.log('页面点击次数:', clickCount);
        
        // 每点击10次，标题文字变化
        if (clickCount % 10 === 0) {
            h1.textContent = '点击了 ' + clickCount + ' 次！';
            setTimeout(() => {
                h1.textContent = '冰红茶老大';
            }, 2000);
        }
    });

    // ========== 7. 键盘事件 - 按空格键切换背景 ==========
    document.addEventListener('keydown', function(e) {
        if (e.code === 'Space') {
            e.preventDefault(); // 阻止页面滚动
            if (document.body.style.backgroundColor) {
                document.body.style.backgroundColor = '';
            } else {
                document.body.style.backgroundColor = '#f0f0f0';
            }
        }
    });

    // ========== 8. 图片加载失败处理 ==========
    img.addEventListener('error', function() {
        this.alt = '😢 图片加载失败';
        this.style.display = 'block';
        this.style.width = '600px';
        this.style.height = '600px';
        this.style.backgroundColor = '#eee';
        this.style.lineHeight = '600px';
        this.style.textAlign = 'center';
        this.style.fontSize = '24px';
        this.style.color = '#999';
    });

    // ========== 9. 鼠标跟随效果（可选） ==========
    document.addEventListener('mousemove', function(e) {
        const x = e.clientX;
        const y = e.clientY;
        console.log('鼠标位置:', x, y);
    });

    // ========== 10. 页面加载完成提示 ==========
    console.log('✅ 页面加载完成！');
    console.log('💡 试试：');
    console.log('   - 点击标题看颜色变化');
    console.log('   - 双击段落文字切换');
    console.log('   - 点击图片放大/缩小');
    console.log('   - 按空格键切换背景');
    console.log('   - 鼠标悬停标题看阴影阴影');
});