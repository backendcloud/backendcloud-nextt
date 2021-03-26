title: cyborg agent
date: 2017-05-01 17:49:47
categories:
- 智能云
tags:
- Cyborg
---

# cyborg agent提案

## 问题描述

Cyborg的需要一下功能：包括在计算机节点上管理代理，定位加速器，监控加速器状态和协调加速器驱动程序。



## 用例

在OpenStack中将加速器连接到虚拟机实例。



## 提议变更

cyborg agent驻留在各种计算机主机上，并监控对计算节点上的加速器进行监控。

如果某一个计算节点上加速器存在但没有设置，代理将通知conductor并建议手动检查。

用cyborg agent来监控加速器的状态并报告给conductor，并通过这些报告信息来帮助调度和操作。



## 数据模型

* cyborg agent将在其检测到的加速器时在数据库中创建新条目，它还将更新具有加速器当前状态的那些条目。
* 更多临时数据，如加速器的当前使用情况将通过消息传递系统进行广播，不会被存储。
* Cyborg Agent将保留本地缓存数据，目的是在系统中断或连接丢失不会失去加速器状态。



# cyborg agent具体内容

Cyborg代理将安装在正在或者可能会使用加速器的计算节点上。

## cyborg agent功能：

* 检查硬件以查找加速器
* 管理安装驱动程序，依赖关系，安装和卸载
* 一旦生成实例生成后，将实例连接到加速器，
* 将有关可用加速器，状态和利用率的数据报告给Cyborg服务器


## 硬件发现：

该实例每几秒钟扫描一次加速器和现有加速器的使用情况，并将该信息以心跳信息的形式报告给Cyborg服务器，以帮助管理管理加速器的调度和可用性。



## 硬件管理：

可以使用Ansible来管理每个加速器及其驱动程序的配置文件和其他设置。将为每一种支持的硬件安装和卸载配置ansible playbook。


## 实例连接：

一旦生成实例，需要连接到主机上的某个加速器，Cyborg服务器将向Cyborg代理发送消息，通知agent新实例。由于连接方法可能会在不同的加速器之间发生显着变化，所以驱动程序应该提供一个连接功能来调用。



